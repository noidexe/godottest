extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var rotation_speed = 10

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var scaling = rand_range(0.25, 2.5)
	rotation_speed = rotation_speed / scaling * rand_range(-1.0 , 1.0)
	set_scale(Vector2(scaling, scaling))
	set_process(true)

func _process(delta):
	rotate(delta * rotation_speed)
