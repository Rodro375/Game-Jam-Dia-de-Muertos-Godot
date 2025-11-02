extends PlayerStateGravityBase

func start():
	player.play_animation(player.animations.side_attack)
	player.can_attack = false
	$"../../Timers/AfterAttack".start()
	
func on_physics_process(delta):
	input_direction_active()
	player.velocity.x = input_direction.x * player.movement_stats.running_speed	
	
	if not player.animation_player.is_playing():
		#if player.velocity.y < 0:
			#pass
		#elif player.velocity.y > 0:
		state_machine.change_state_to(player.states.fall)
		#elif player.is_on_floor():
			#state_machine.change_state_to(player.states.idle)

	handle_gravity(delta)
	player.move_and_slide()
