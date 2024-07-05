extends CharacterBody2D

@onready var Anim_tree:AnimationTree = $Player_visuals/AnimationTree
@onready var Anim_state_machine = Anim_tree.get("parameters/playback")

var JUMP_VELOCITY = -400.0
var ACCEL = 12.0
var SWIM_MAX_SPEED = 300.0
var RUN_MAX_SPEED = 350.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var flipped:int = -1

var in_water = false

var health:float = 100

func _process(_delta):
	#print(1.0/_delta)
	$Camera2D.position = get_local_mouse_position()/7

func _physics_process(_delta):
	var head_angle = get_angle_to(get_global_mouse_position())
	if head_angle > -1.5 and head_angle < 1.5:
		flipped = -1
	else:
		flipped = 1
	
	$Player_visuals.scale.x = 0.15 * flipped
	
	if !(head_angle < 2.5 and head_angle > 0.5):
		get_node("Player_visuals/Skeleton2D/root/UpperBody/Head").scale = Vector2(1,1) * flipped
		get_node("Player_visuals/Skeleton2D/root/UpperBody/Head").rotation = (head_angle + deg_to_rad(75 * flipped)) * flipped
	  
	health = clamp(health, 0, 100)
	move_and_slide()
	

func update_velocity(weight):
	SWIM_MAX_SPEED = 275.0 - (weight * 2)
	RUN_MAX_SPEED = 300.0 - (weight * 2)
	JUMP_VELOCITY = -400.0 + (weight * 3)



