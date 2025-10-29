extends PlayerStateGravityBase

func start():
	player.play_animation(player.animations.run)	

func on_physics_process(delta):
	input_direction_active()
	
	player.velocity.x = input_direction.x * player.movement_stats.running_speed
	
	if input_direction.x == 0:
		state_machine.change_state_to(player.states.idle)
	
	handle_gravity(delta)
	player.move_and_slide()
	
func on_input(event):
	if Input.is_action_just_pressed("Jump"):
		state_machine.change_state_to(player.states.jump)
