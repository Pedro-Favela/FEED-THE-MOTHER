extends Area2D

func _on_body_entered(body):
	if "in_water" in body:
		body.in_water = true
	
func _on_body_exited(body):
	if "in_water" in body:
		body.in_water = false


