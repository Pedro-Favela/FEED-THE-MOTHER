extends StaticBody2D

var bubble = preload("res://Scenes/Enviroment/AirGeyser/airBubble.tscn")
var rand_value:float

func _ready():
	rand_value = randf_range(0.7,1.5)
	await get_tree().create_timer(rand_value).timeout
	var instance = bubble.instantiate()
	call_deferred("add_child", instance)
	instance.position = Vector2(0,-20)
	instance.scale = instance.scale * rand_value
	instance.air_amount = instance.air_amount * rand_value
	_ready()
