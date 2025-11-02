extends CondorStateBase

func start():
	condor.can_attack = false
	condor.play_animation(condor.animations.attack)
	
func on_physics_process(delta):
	if not condor.animation_player.is_playing():
		state_machine.change_state_to(condor.states.fly)
