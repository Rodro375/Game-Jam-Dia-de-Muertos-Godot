extends PlayerStateGravityBase

func start():
	player.play_animation(player.animations.damage)
	
func on_physics_process(delta):
	input_direction_active()
	player.velocity.x = input_direction.x * player.movement_stats.running_speed
	
	if not player.animation_player.is_playing():
		if player.current_health <= 0:
			$"../../Sprite/HurtBox".monitorable = false
			$"../../Sprite/HurtBox".monitoring = false
			state_machine.change_state_to(player.states.death)
		else:
			state_machine.change_state_to(player.states.fall)

	handle_gravity(delta)
	player.move_and_slide()
