extends PlayerStateGravityBase

func start():
	print("otro gato")

func on_physics_process(delta):
	player.play_animation(player.animations.idle)
	player.velocity.x = 0
	
	input_direction_active()
	if input_direction.x != 0:
		state_machine.change_state_to(player.states.run)
	
	handle_gravity(delta)
	player.move_and_slide()
	
func on_input(event):
	if Input.is_action_just_pressed("Jump"):
		state_machine.change_state_to(player.states.jump)
