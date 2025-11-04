extends PlayerStateGravityBase

func start():
	player.play_animation(player.animations.death)
	
func on_physics_process(delta):
	pass
	if not player.animation_player.is_playing():
		$"../../../CanvasLayer/PauseMenu".pause()
		Global.player_current_strenght += 1
		$"../../../CanvasLayer/PauseMenu".disable_resume(true)
		controlled_node.queue_free()
