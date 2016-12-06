extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var angular_velocity = 5
export var linear_velocity = 500

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_angular_velocity( rand_range(0.5 * angular_velocity , angular_velocity ))
	set_fixed_process(true)

func _fixed_process(delta):
	set_linear_velocity( -Vector2( sin(get_rot()) * linear_velocity , cos(get_rot()) * linear_velocity ) )

func _on_BodyTrigger_area_enter( area ):
	var explosion = preload("res://prefabs/Explosion.tscn").instance()
	get_parent().add_child(explosion)
	explosion.set_pos(get_pos())
	queue_free()
