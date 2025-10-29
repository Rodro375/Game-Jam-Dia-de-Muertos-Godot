extends Node

@onready var player:Player = self.owner

func _physics_process(delta):
	if Input.is_action_pressed("Left") or Input.is_action_pressed("Right"):
		player.velocity.x = Input.get_axis("Left", "Right")
