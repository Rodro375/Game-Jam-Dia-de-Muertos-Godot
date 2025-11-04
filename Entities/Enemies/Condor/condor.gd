class_name Condor 
extends CharacterBody2D

signal health_changed
signal body_entered
signal enemy_died

@export var movement_stats:CharacterMovementStats
@export var projectile_scene:PackedScene

@onready var sprite:Sprite2D = $Sprite2D
@onready var animation_player:AnimationPlayer = $AnimationPlayer
@export var max_health:int = 150
@onready var current_health:int = max_health
@onready var fire_point = $Sprite2D/FirePoint
var states:CondorStateNames = CondorStateNames.new()
var animations:CondorAnimations = CondorAnimations.new()

var damage_to_player:int = 20
var distance:Vector2
var can_attack:bool = true
var can_move:bool = true
var speed:float = -50
var damage = 25
var time:float = 0.0

func _ready():
	$ProyectileTimeout.start()

func set_facing_direction(x:float):
	if abs(x) > 0:
		sprite.scale.x = 1 if (x < 0) else -1

func play_animation(animation_name:String):
	animation_player.play(animation_name)

func _process(delta):
	var player_position:Vector2 = get_tree().get_first_node_in_group("player").position
	distance.x = (player_position.x - position.x)
	if current_health <= 0:
		emit_signal("enemy_died")
		queue_free()
	move_and_slide()

func _on_after_attack_timeout():
	can_attack = true

func to_move():
	var player_x_position:float = get_tree().get_first_node_in_group("player").position.x
	distance.x = (player_x_position - position.x)
	if distance.x != 0:
		if can_move == true:
			velocity.x = sign(distance.x) * 50
	else:
		velocity.x = 0

func _on_proyectile_timeout_timeout():
	shoot()

func shoot():
	var projectile = projectile_scene.instantiate()
	get_tree().current_scene.add_child(projectile)
	
	projectile.global_position = fire_point.global_position
	
	var player = get_tree().get_first_node_in_group("player")
	if player:
		var direction = (player.global_position - fire_point.global_position).normalized()
		projectile.direction = direction
