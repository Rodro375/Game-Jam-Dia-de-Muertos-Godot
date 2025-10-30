extends PlayerStateGravityBase

func start():
	player.play_animation(player.animations.jump)
	choose_random_audio($"../../Audio/Jump")
	player.wall_raycast.enabled = true

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

func on_input(event):
	if Input.is_action_just_pressed("Dash") and player.movement_stats.can_dash == true:
		state_machine.change_state_to(player.states.dash)
	if Input.is_action_just_pressed("Jump") and player.movement_stats.can_double_jump == true:
		player.velocity.y = player.movement_stats.jump_speed + 20
		player.movement_stats.can_double_jump = false
		state_machine.change_state_to(player.states.jump)
	if Input.is_action_just_pressed("Attack"):
		state_machine.change_state_to(player.states.attack)
