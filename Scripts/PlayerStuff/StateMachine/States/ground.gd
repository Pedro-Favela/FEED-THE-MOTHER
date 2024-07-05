extends State

@export_group("States")
@export var air:State

func enter():
	player.motion_mode = CharacterBody2D.MOTION_MODE_GROUNDED

func process_physics(delta):
	player.velocity.y += gravity * delta
	
	var direction = Input.get_axis("LEFT","RIGHT")
	if direction:
		player.velocity.x += ACCEL * delta * direction
		if abs(player.velocity.x) > MAX_RUN_SPEED:
			player.velocity.x = direction * MAX_RUN_SPEED
		Anim_state_machine.travel("Running")
	else:
		Anim_state_machine.travel("Idle")
		player.velocity.x *= 0.9

	if player.is_on_floor() and Input.is_action_just_pressed("UP"):
		player.velocity.y = -JUMP_VELOCITY
	
	if !player.is_on_floor():
		return air
	
	return null
