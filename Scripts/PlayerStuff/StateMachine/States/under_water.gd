extends State

@export_group("States")
@export var air:State

func enter():
	player.motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

func process_physics(delta):
	var water_gravity
	if !player.get_node("BreathManager").in_water:
		water_gravity = 100
	else:
		water_gravity = 20
	player.position.y += -water_gravity*delta
	player.rotation = lerp_angle(player.rotation, player.velocity.angle() + deg_to_rad(90), 0.3)
	#rotation = velocity.angle() + deg_to_rad(90)
	
	
	var direction = Input.get_vector("LEFT", "RIGHT","UP", "DOWN")

	if direction:
		player.velocity += direction * ACCEL * delta
		if player.velocity.length() > SWIM_MAX_SPEED:
			player.velocity = player.velocity.normalized() * SWIM_MAX_SPEED
	elif player.velocity.length() > 0:
		player.velocity = player.velocity * 0.95
	
	if player.get_slide_collision_count() > 0:
		player.velocity = player.velocity * 0.9
	
	if !player.in_water:
		return air
