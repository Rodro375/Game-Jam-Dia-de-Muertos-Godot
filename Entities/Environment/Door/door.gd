extends Area2D

func _ready():
	$CollisionShape2D.disabled = true
	$AnimatedSprite2D.frame = Global.level_index-1
	
func change_disable():
	$CollisionShape2D.disabled = false
