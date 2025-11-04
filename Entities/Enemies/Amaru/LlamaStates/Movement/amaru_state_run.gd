extends AmaruStateBase

func start():
	amaru.play_animation(amaru.animations.run)

func on_physics_process(delta):
	
	if amaru.can_attack and amaru.ready_to_attack:
		state_machine.change_state_to(amaru.states.attack)
		
	
	
#func _on_detection_area_area_entered(area:Node2D):
	#if area.owner.is_in_group("player") and amaru.can_attack == true:
		#state_machine.change_state_to(amaru.states.attack)
