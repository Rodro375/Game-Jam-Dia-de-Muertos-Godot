extends CondorStateBase

var condor_start_position:Vector2

func start():
	condor_start_position = condor.global_position
	
	condor.play_animation(condor.animations.fly)

func on_physics_process(delta):
	condor.time += delta * 2.5
	condor.global_position.y = condor_start_position.y + sin(condor.time) * 15
	condor.velocity.x = condor.speed
	if $"../../RayCast2D".is_colliding():
		var obj = $"../../RayCast2D".get_collider()
		if obj.is_in_group("terrain"):
			print("ola")
			change_direction()

func _on_detection_area_area_entered(area:Node2D):
	if area.owner.is_in_group("player") and condor.can_attack == true:
		state_machine.change_state_to(condor.states.attack)

func change_direction():
	condor.speed *= -1
	$"../../RayCast2D".scale.x *= -1
