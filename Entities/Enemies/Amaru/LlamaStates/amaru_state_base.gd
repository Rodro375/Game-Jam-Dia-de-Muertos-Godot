class_name AmaruStateBase extends StateBase

var gravity:float = ProjectSettings.get_setting("physics/2d/default_gravity")

var amaru:Amaru:
	set (value):
		controlled_node = value
	get:
		return controlled_node

var input_direction = Vector2.ZERO

func handle_gravity(delta):
	amaru.velocity.y += gravity * delta
