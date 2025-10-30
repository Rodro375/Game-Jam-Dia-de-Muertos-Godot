extends PlayerStateGravityBase

func start():
	player.play_animation(player.animations.dash)
	player.velocity.y = 0
	player.movement_stats.can_dash = false
	choose_random_audio($"../../Audio/Dash")
	%DashTimer.start()

func on_physics_process(delta):
	input_direction_active()
	
	player.velocity.x = 400 * player.sprite.scale.x
	
	if %DashTimer.time_left == 0:
		state_machine.change_state_to(player.states.fall)
		
	player.move_and_slide()
