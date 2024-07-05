extends StaticBody2D

@export var line_length:int = 0

func _ready():
	update_line()
	$CollisionPolygon2D.polygon = $Polygon2D.polygon

func update_line():
	line_length = clamp(line_length + 1,0,$Polygon2D.polygon.size())
	var temp_array: Array = []
	for i in line_length:
		temp_array.append($Polygon2D.polygon[i])
	$Line2D.points = temp_array

