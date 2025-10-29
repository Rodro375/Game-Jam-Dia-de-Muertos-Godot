class_name Player
extends CharacterBody2D

@export var movement_stats:CharacterMovementStats

@onready var sprite:Sprite2D = $Sprite
@onready var wall_raycast:RayCast2D = $Sprite/RayCast
@onready var animation_player:AnimationPlayer = $AnimationPlayer

var states:PlayerStateNames = PlayerStateNames.new()
var animations:PlayerAnimations = PlayerAnimations.new()

const SPEED = 50.0
var axis:Vector2

func set_facing_direction(x:float):
	if abs(x) > 0:
		sprite.scale.x = -1 if (x < 0) else 1

func is_facing_right() -> bool:
	return sprite.scale.x > 0

func _process(delta):
	set_facing_direction(velocity.x)

func play_animation(animation_name:String):
	animation_player.play(animation_name)
