extends Node2D

@export var Fishes: Array[PackedScene]
@export var Fish_qntt: int = 5
@onready var player = get_tree().get_first_node_in_group("Player")

func _process(_delta):
	if is_instance_valid(player) and (player.global_position - global_position).length() > 1000:
		if get_child_count() < Fish_qntt:
			var instance = Fishes.pick_random().instantiate()
			call_deferred("add_child", instance)
