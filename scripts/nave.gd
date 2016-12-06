
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"
var use_accel = false
const ASPEED = 5
const LSPEED = 1000
onready var thrust = get_node("Camera2D/Thrust")
onready var sprite = get_node("Sprite")
var thrust_value

func _fixed_process(delta):
	if use_accel == true:
		set_angular_velocity(-ASPEED * 0.2 * Input.get_accelerometer().x)
	else:
		if Input.is_action_pressed("move_left"):
			set_angular_velocity(-ASPEED)
		elif Input.is_action_pressed("move_right"):
			set_angular_velocity(ASPEED)
	
	thrust_value = thrust.get_value()
	set_linear_velocity( -Vector2( sin(get_rot()) * thrust_value * LSPEED , cos(get_rot()) * thrust_value * LSPEED ) )
	sprite.set_rot(0 + 0.05 * -get_angular_velocity())
	
	#var motion = velocity * delta
	#motion = move (motion)
	
	
#	if is_colliding():
#		var normal = get_collision_normal()
#		motion = normal.slide( motion)
#		velocity = normal.slide (velocity)
#		move(motion)
#	
func _ready():
	# Initialization here
	if OS.get_name() == "Android": use_accel = true
	set_angular_damp(5)
	set_fixed_process(true)

