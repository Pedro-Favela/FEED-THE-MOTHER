extends CharacterBody2D

var happines = 0
@onready var player = get_tree().get_first_node_in_group("Player")

func _on_area_2d_body_entered(body):
	if body is Fish:
		happines += body.weight
		$Happines.value = happines
		if body.get_parent() == player.get_node("CurrentItem"):
			body.get_parent().throw_current_item(true)
		body.queue_free()
		return
	if body is Item and !body.picked:
		happines -= body.weight
		body.velocity = Vector2.RIGHT.rotated(deg_to_rad(-45)) * 300
		$Happines.value = happines
