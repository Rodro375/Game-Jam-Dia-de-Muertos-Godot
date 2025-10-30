extends PlayerStateGravityBase

func start():
	player.play_animation(player.animations.run)
	$"../../Audio/Run".play()

func end():
	$"../../Audio/Run".stop()

func on_physics_process(delta):
	input_direction_active()
	
	player.velocity.x = input_direction.x * player.movement_stats.running_speed
	
	if input_direction.x == 0:
		state_machine.change_state_to(player.states.idle)
	
	handle_gravity(delta)
	player.move_and_slide()
	
func on_input(event):
	if Input.is_action_just_pressed("Jump"):
		state_machine.change_state_to(player.states.jump)
	if Input.is_action_just_pressed("Dash") and player.movement_stats.can_dash == true:
		state_machine.change_state_to(player.states.dash)
	if Input.is_action_just_pressed("Attack"):
		state_machine.change_state_to(player.states.attack)
	if Input.is_action_just_pressed("Charge"):
		state_machine.change_state_to(player.states.charge)
	if Input.is_action_just_pressed("Parry"):
		state_machine.change_state_to(player.states.parry)
