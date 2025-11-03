extends PlayerStateGravityBase

func start():
	player.play_animation(player.animations.dash)
	player.velocity.y = 0
	player.movement_stats.can_dash = false
	choose_random_audio($"../../Audio/Dash")
	%DashTimer.start()
	$"../..".collision_layer = 2
	$"../..".collision_mask = 2
	$"../../Sprite/HurtBox/HurtBoxCollision".disabled = true
	
func end():
	$"../..".collision_layer = 1
	$"../..".collision_mask = 1
	$"../../Sprite/HurtBox/HurtBoxCollision".disabled = false
	

func on_physics_process(delta):
	input_direction_active()
	
	player.velocity.x = 400 * player.sprite.scale.x
	
	if %DashTimer.time_left == 0:
		state_machine.change_state_to(player.states.fall)
		
	player.move_and_slide()
