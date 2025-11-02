extends LlamaStateBase

func start():
	llama.can_attack = false
	llama.play_animation(llama.animations.attack)
	
func on_physics_process(delta):
	llama.to_move()
	if not llama.animation_player.is_playing():
		state_machine.change_state_to(llama.states.run)
