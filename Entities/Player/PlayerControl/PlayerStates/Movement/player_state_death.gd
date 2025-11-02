extends PlayerStateGravityBase

func start():
	player.play_animation(player.animations.death)
	
func on_physics_process(delta):
	pass
	#if not player.animation_player.is_playing():
		#controlled_node.queue_free()
