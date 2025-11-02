extends PlayerStateGravityBase

func start():
	player.movement_stats.can_dash = true
	player.movement_stats.can_double_jump = true
	print("otro gato")

func on_physics_process(delta):
	player.play_animation(player.animations.idle)
	player.velocity.x = 0
	
	input_direction_active()
	if input_direction.x != 0:
		state_machine.change_state_to(player.states.run)
	
	if player.velocity.y > 0:
		state_machine.change_state_to(player.states.fall)
	
	handle_gravity(delta)
	player.move_and_slide()
	
func on_input(event):
	if Input.is_action_just_pressed("Jump"):
		state_machine.change_state_to(player.states.jump)
	if Input.is_action_just_pressed("Dash") and player.movement_stats.can_dash == true:
		state_machine.change_state_to(player.states.dash)
	if Input.is_action_pressed("Up"):
		print("nose")
	if Input.is_action_just_pressed("Charge"):
		state_machine.change_state_to(player.states.charge)
	if Input.is_action_just_pressed("Parry"):
		state_machine.change_state_to(player.states.parry)
	if Input.is_action_just_pressed("Strong Attack"):
		state_machine.change_state_to(player.states.strong_attack)
	if player.can_attack == true:
		if Input.is_action_pressed("Up") and Input.is_action_just_pressed("Attack"):
			state_machine.change_state_to(player.states.up_attack)
		elif Input.is_action_just_pressed("Attack"):
			state_machine.change_state_to(player.states.side_attack)

func _on_player_health_changed():
	state_machine.change_state_to(player.states.damage)
