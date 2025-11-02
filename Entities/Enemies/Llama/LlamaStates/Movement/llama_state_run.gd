extends LlamaStateBase

func start():
	llama.play_animation(llama.animations.run)
	llama.to_move()

func on_physics_process(delta):
	llama.to_move()
	handle_gravity(delta)
	
	
func _on_detection_area_area_entered(area:Node2D):
	if area.owner.is_in_group("player") and llama.can_attack == true:
		$"../../Timers/AfterAttack".start()
		state_machine.change_state_to(llama.states.attack)
