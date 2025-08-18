extends Node
class_name State

@onready var player:CharacterBody2D = get_tree().get_first_node_in_group("Player")
@onready var Anim_tree:AnimationTree = player.get_node("Player_visuals/AnimationTree")
@onready var Anim_state_machine = Anim_tree.get("parameters/playback")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func enter():
	pass

func process_frame(_delta: float):
	return null

func process_physics(_delta: float):
	return null

func exit():
	pass
