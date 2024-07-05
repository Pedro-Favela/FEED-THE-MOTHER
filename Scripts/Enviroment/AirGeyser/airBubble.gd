extends CharacterBody2D

var in_water = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var air_amount: float = 10

func _physics_process(delta):
	velocity.y -= gravity/10 * delta
	if velocity.y < -200:
		velocity.y = -200
	move_and_slide()
	await get_tree().physics_frame
	if in_water == false:
		queue_free()
