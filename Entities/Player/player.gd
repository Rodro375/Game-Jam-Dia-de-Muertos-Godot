class_name Player
extends CharacterBody2D

signal health_changed

@export var movement_stats:CharacterMovementStats

@onready var sprite:Sprite2D = $Sprite
@onready var wall_raycast:RayCast2D = $Sprite/RayCast
@onready var animation_player:AnimationPlayer = $AnimationPlayer

@export var max_health:int = 100
@onready var current_health:int = Global.player_health

var states:PlayerStateNames = PlayerStateNames.new()
var animations:PlayerAnimations = PlayerAnimations.new()

const SPEED = 50.0
var invul_after_damage:bool = false
var can_attack:bool = true
var axis:Vector2
var player_strenght:float

func set_facing_direction(x:float):
	if abs(x) > 0:
		sprite.scale.x = -1 if (x < 0) else 1

func is_facing_right() -> bool:
	return sprite.scale.x > 0

func _ready():
	player_strenght = Global.player_current_strenght/2

func _process(delta):
	Global.player_health = current_health
	set_facing_direction(velocity.x)
	if $StateMachine.current_state.name == "PlayerStateStrongAttack":
		$"../Camera2D".screen_shake(11,0.3)
	print(Global.level_index)
	print(Global.player_current_strenght)

func play_animation(animation_name:String):
	animation_player.play(animation_name)
	
func _on_hurt_box_area_entered(area:Node2D):
	if area.is_in_group("enemy_attack") and invul_after_damage == false:
		$"../Camera2D".screen_shake(8,0.3)
		if $StateMachine.current_state.name == "PlayerStateParry":
			animation_player.play("parry")
			$Audio/Damage.play()
			if !area.is_in_group("projectile"):
				area.owner.current_health -= 100 * player_strenght
			else:
				area.queue_free()
		elif area.is_in_group("projectile"):
			$Timers/InvulAfterDamage.start()
			invul_after_damage = true
			current_health -= area.damage
			health_changed.emit()
		else:
			$Timers/InvulAfterDamage.start()
			invul_after_damage = true
			current_health -= area.owner.damage
			health_changed.emit()

func _on_invul_after_damage_timeout():
	invul_after_damage = false

func _on_attack_area_entered(area:Node2D):
	if area.is_in_group("enemy_hurtbox"):
		$"../Camera2D".screen_shake(7.5,0.15)
		$Audio/Damage.play()
		if $StateMachine.current_state.name == "PlayerStateDownAttack":
			movement_stats.can_double_jump = true
			area.owner.current_health -= 50 * player_strenght
			velocity.y = -260
		elif $StateMachine.current_state.name == "PlayerStateStrongAttack":
			area.owner.current_health -= 150 * player_strenght
		else:
			area.owner.current_health -= 50 * player_strenght

func _on_after_attack_timeout():
	can_attack = true
