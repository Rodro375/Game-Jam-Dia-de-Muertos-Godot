extends AmaruStateBase

func start():
	amaru.ready_to_attack = false
	$"../../Timers/AfterAttack".start()
	amaru.play_animation(amaru.animations.attack)
	
func on_physics_process(delta):
	if not amaru.animation_player.is_playing():
		state_machine.change_state_to(amaru.states.run)
