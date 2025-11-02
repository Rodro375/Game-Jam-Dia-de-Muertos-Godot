extends PlayerStateGravityBase

func start():
	player.play_animation(player.animations.fall)

func on_physics_process(delta):
	input_direction_active()
	player.velocity.x = input_direction.x * player.movement_stats.running_speed
	
	if is_on_wall_raycast() and input_direction.x != 0:
		state_machine.change_state_to(player.states.wall_slide)
	
	if player.velocity.y >= 0 and player.is_on_floor():
		player.wall_raycast.enabled = false
		state_machine.change_state_to(player.states.idle)
	
	handle_gravity(delta)
	player.move_and_slide()

func on_input(event):
	if Input.is_action_just_pressed("Dash") and player.movement_stats.can_dash == true:
		state_machine.change_state_to(player.states.dash)
	if Input.is_action_just_pressed("Jump") and player.movement_stats.can_double_jump == true:
		player.velocity.y = player.movement_stats.jump_speed + 20
		player.movement_stats.can_double_jump = false
		state_machine.change_state_to(player.states.jump)
	if player.can_attack == true:
		if Input.is_action_pressed("Up") and Input.is_action_just_pressed("Attack"):
			state_machine.change_state_to(player.states.up_attack)
		elif Input.is_action_pressed("Down") and Input.is_action_just_pressed("Attack"):
			state_machine.change_state_to(player.states.down_attack)
		elif Input.is_action_just_pressed("Attack"):
			state_machine.change_state_to(player.states.side_attack)
