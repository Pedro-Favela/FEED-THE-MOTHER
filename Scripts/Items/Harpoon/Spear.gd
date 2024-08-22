extends Item

var stuck: bool = false

func _physics_process(delta):
	if !picked:
		if pickable == false:
			timer -= delta
		if timer <= 0:
			pickable = true
		
		if stuck:
			return
		
		if in_water:
			velocity = velocity * 0.99
			velocity.y += gravity/5 * delta
		else:
			velocity.y += gravity * delta
		
		rotation = velocity.angle()
		move_and_slide()




func _on_damage_body_entered(body):
	if stuck or get_parent() == player.get_node("CurrentItem") or ("health" in body and body.health <= 0):
		return
	velocity = Vector2.ZERO
	stuck = true
	
	call_deferred("reparent", body)
	
	if "health" in body and body.health > 0:
		body.health -= 1
		position += body.velocity * body.get_physics_process_delta_time()
		body.speed -= body.speed/3
		if body.health <= 0:
			picked = true
			pickable = false
			for node in body.get_children():
				if node is Item:
					node.picked = true
					node.pickable = false
		else:
			picked = false
	
	

