extends PlayerStateGravityBase

func start():
	player.animations.wall_slide

func on_physics_process(delta):
	input_direction_active()
	
	player.velocity.y = move_toward(player.velocity.y, 20, 15)
	 
	if input_direction.x == 0 or not is_on_wall_raycast():
		state_machine.change_state_to(player.states.fall)
		
	if player.is_on_floor():
		state_machine.change_state_to(player.states.idle)
		
	player.move_and_slide()

func on_input(event):
	if Input.is_action_just_pressed("Jump"):
		%WallJumpPush.start()
		player.velocity.x = 100 * -player.sprite.scale.x
		player.velocity.y = player.movement_stats.jump_speed + 20
		state_machine.change_state_to(player.states.jump)
