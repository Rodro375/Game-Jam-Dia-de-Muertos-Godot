extends LlamaStateBase

func start():
	llama.play_animation(llama.animations.run)

func on_physics_process(delta):
	handle_gravity(delta)
	
	if llama.can_attack and llama.ready_to_attack:
		state_machine.change_state_to(llama.states.attack)
		
	
	
#func _on_detection_area_area_entered(area:Node2D):
	#if area.owner.is_in_group("player") and llama.can_attack == true:
		#state_machine.change_state_to(llama.states.attack)
