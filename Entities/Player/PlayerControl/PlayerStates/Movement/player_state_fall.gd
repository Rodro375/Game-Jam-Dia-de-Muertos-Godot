extends PlayerStateGravityBase

func start():
	player.wall_raycast.enabled = true
	is_on_wall_raycast()

func on_physics_process(delta):
	input_direction_active()
	player.velocity.x = input_direction.x * player.movement_stats.running_speed
	
	
	if is_on_wall_raycast() and input_direction.x != 0:
		state_machine.change_state_to(player.states.wall_slide)
	
	if player.velocity.y >= 0 and player.is_on_floor():
		player.wall_raycast.enabled = false
		if player.velocity.x != 0:
			state_machine.change_state_to(player.states.run)
		else: 
			state_machine.change_state_to(player.states.idle)
	
	handle_gravity(delta)
	player.move_and_slide()
