extends Area2D

@export var speed: float
var direction: Vector2 = Vector2.ZERO
var player_position:Vector2
var damage = 10

func _process(delta):
	global_position += direction * speed * delta
	$AnimatedSprite2D.rotation = direction.angle()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	if area.is_in_group("player_hurtbox"):
		queue_free()
