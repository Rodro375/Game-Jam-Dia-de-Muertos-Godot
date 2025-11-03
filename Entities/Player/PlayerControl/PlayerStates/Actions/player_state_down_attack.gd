extends PlayerStateGravityBase

func start():
	attack_interrupted = false
	player.play_animation(player.animations.down_attack)
	player.can_attack = false
	player.sprite.offset.y = 40
	$"../../Timers/AfterAttack".start()
	get_tree().create_timer(0.025).timeout
	if attack_interrupted == true:
		return
	$"../../Sprite/Attack/DownSlashCollision2".disabled = false
	$"../../Sprite/Attack".monitorable = true
	$"../../Sprite/Attack".monitoring = true

func end():
	player.sprite.offset.y = 0
	attack_interrupted = true
	$"../../Sprite/Attack/DownSlashCollision2".disabled = true
	$"../../Sprite/Attack".monitorable = false
	$"../../Sprite/Attack".monitoring = false

func on_physics_process(delta):
	input_direction_active()
	player.velocity.x = input_direction.x * player.movement_stats.running_speed
	
	if not player.animation_player.is_playing():
		#if player.velocity.y < 0:
			#pass
		#elif player.velocity.y > 0:
		state_machine.change_state_to(player.states.fall)
		
	if player.is_on_floor():
		
		state_machine.change_state_to(player.states.idle)
	
	
	handle_gravity(delta)
	player.move_and_slide()
