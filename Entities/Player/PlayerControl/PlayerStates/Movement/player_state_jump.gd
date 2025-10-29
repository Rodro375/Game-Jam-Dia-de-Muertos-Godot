extends PlayerStateGravityBase

func start():
	player.play_animation(player.animations.jump)

func on_physics_process(delta):
	
	if %WallJumpPush.time_left == 0:
		input_direction_active()
		player.velocity.x = input_direction.x * player.movement_stats.running_speed
	
	if player.is_on_floor() and player.velocity.y >= 0: 
		player.velocity.y = player.movement_stats.jump_speed
	elif player.velocity.y > 0:
		state_machine.change_state_to(player.states.fall)
	
	handle_gravity(delta)
	player.move_and_slide()
