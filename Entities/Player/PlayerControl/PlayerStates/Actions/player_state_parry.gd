extends PlayerStateGravityBase

func start():
	player.play_animation(player.animations.pre_parry)
	$"../../Audio/Parry/PreParry".play()

func on_physics_process(delta):
	if not player.animation_player.is_playing():
		state_machine.change_state_to(player.states.idle)
