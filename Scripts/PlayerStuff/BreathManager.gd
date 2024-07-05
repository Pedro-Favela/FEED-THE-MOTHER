extends CharacterBody2D

var in_water = false
var breath:float = 10
var damage:float = 0

func _physics_process(delta):
	if in_water:
		breath -= 5*delta
	else:
		breath += 10*delta
	
	breath = clamp(breath, 0, 100)
	#print(breath)
	if breath <= 0:
		get_parent().health -= 10 * delta
	elif breath >= 100:
		get_parent().health += 5 * delta


func _on_catch_item_body_entered(body):
	if body.get_collision_layer_value(6):
		breath += body.air_amount/1.5
		body.queue_free()
