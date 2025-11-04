class_name Llama 
extends CharacterBody2D

signal health_changed
signal body_entered
signal enemy_died

@export var movement_stats:CharacterMovementStats

@onready var sprite:Sprite2D = $Sprite2D
@onready var animation_player:AnimationPlayer = $AnimationPlayer
@export var max_health:int = 250
@onready var current_health:int = max_health

var states:LlamaStateNames = LlamaStateNames.new()
var animations:LlamaAnimations = LlamaAnimations.new()

var damage_to_player:int = 20
var distance:float
var can_attack:bool = false
var ready_to_attack:bool = true
var can_move:bool = true
var damage = 25

func set_facing_direction(x:float):
	if abs(x) > 0:
		sprite.scale.x = 1 if (x < 0) else -1

func play_animation(animation_name:String):
	animation_player.play(animation_name)

func _process(delta):
	set_facing_direction(sign(distance))
	to_move()
	if current_health <= 0:
		emit_signal("enemy_died")
		queue_free()
	move_and_slide()

func _on_after_attack_timeout():
	ready_to_attack = true

func to_move():
	var player_x_position:float = get_tree().get_first_node_in_group("player").position.x
	distance = (player_x_position - position.x)
	if distance != 0:
		if can_move == true:
			velocity.x = sign(distance) * 50
		else:
			velocity.x = 0
	else:
		velocity.x = 0
		
func _on_detection_area_area_entered(area):
	if area.is_in_group("player_hurtbox"):
		can_move = false
		can_attack = true

func _on_detection_area_area_exited(area):
	if area == null or area.owner == null:
		return
	if area.is_in_group("player_hurtbox"):
		can_move = true
		can_attack = false
