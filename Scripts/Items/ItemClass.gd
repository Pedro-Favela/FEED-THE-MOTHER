extends CharacterBody2D
class_name Item

@export var display_name:String = "Placeholder"
@export var weight:float
var in_water = false

var picked = true
var pickable = false
var timer = 0.2

@onready var player = get_tree().get_first_node_in_group("Player")
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	if get_parent() != player.get_node("CurrentItem"):
		picked = false
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING

func _physics_process(delta):
	if !picked:
		unpicked_item_physics(delta)

func unpicked_item_physics(delta):
	if pickable == false:
		timer -= delta
	if timer <= 0:
		pickable = true
	
	if velocity.length() > 20:
		#rotation = velocity.angle()
		rotation = lerp_angle(rotation, velocity.angle(), 0.9)
	
	if is_on_wall():
		velocity = velocity.bounce(get_wall_normal()) * 0.5
	
	if in_water:
		velocity = velocity * 0.95
		velocity.y += gravity/10 * delta
	else:
		velocity.y += gravity * delta
	
	move_and_slide()

func action():
	print("estou sendo usado :(")
