extends PlayerStateBase

func start():
	player.play_animation(player.animations.strong_attack)

func on_physics_process(delta):
	if not player.animation_player.is_playing():
		state_machine.change_state_to(player.states.idle)
