extends CondorStateBase

func start():
	condor.play_animation(condor.animations.fly)

func on_physics_process(delta):
	condor.velocity.y = sin(delta*20)
	
	
func _on_detection_area_area_entered(area:Node2D):
	if area.owner.is_in_group("player") and condor.can_attack == true:
		$"../../Timers/AfterAttack".start()
		state_machine.change_state_to(condor.states.attack)
