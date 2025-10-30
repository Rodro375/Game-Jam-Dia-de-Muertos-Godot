class_name PlayerStateBase extends StateBase

var player:Player:
	set (value):
		controlled_node = value
	get:
		return controlled_node

var input_direction = Vector2.ZERO

func input_direction_active():
	input_direction.x = Input.get_axis("Left","Right")
	input_direction.y = Input.get_axis("Up","Down")

func is_on_wall_raycast():
	var wall:Object 
	if player.wall_raycast.is_colliding():
		wall = player.wall_raycast.get_collider()
		if wall:
			if wall.is_in_group("terrain"):
				return true
			else:
				return false
		else:
			false

func choose_random_audio(parent:Node2D):
	var audio:AudioStreamPlayer2D = parent.get_children().pick_random()
	audio.play()
