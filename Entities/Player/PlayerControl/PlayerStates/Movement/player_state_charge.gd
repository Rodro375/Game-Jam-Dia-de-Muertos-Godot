extends PlayerStateGravityBase

func start():
	player.play_animation(player.animations.charge)
	$"../../Audio/Charge".play()

func end():
	$"../../Audio/Charge".stop()

func on_physics_process(delta):
	pass
	
func on_input(event):
	if Input.is_action_just_released("Charge"):
		state_machine.change_state_to(player.states.idle)
