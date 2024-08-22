@tool
extends StaticBody2D

func _process(_delta):
	if Engine.is_editor_hint():
		$CollisionPolygon2D.polygon = $Polygon2D.polygon
		$Line2D.points = $Polygon2D.polygon
