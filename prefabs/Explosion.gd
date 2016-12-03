extends Particles2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var timer = get_node("Timer")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_emitting(true)
	timer.connect("timeout", self, "queue_free")