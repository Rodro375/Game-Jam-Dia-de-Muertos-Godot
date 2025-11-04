extends LlamaStateBase

func start():
	llama.ready_to_attack = false
	$"../../Timers/AfterAttack".start()
	llama.play_animation(llama.animations.attack)
	
func on_physics_process(delta):
	if not llama.animation_player.is_playing():
		state_machine.change_state_to(llama.states.run)
