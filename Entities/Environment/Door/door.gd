extends Area2D

func _ready():
	$CollisionShape2D.disabled = true
	
func change_disable():
	$CollisionShape2D.disabled = false
