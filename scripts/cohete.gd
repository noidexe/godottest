extends SamplePlayer2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
onready var thrust = get_tree().get_root().get_node("Node2D/UI/Thrust")
export var base_pitch_scale = 0.5
export var pitch_scale_multiplier = 2.0


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	
func _process(delta):
	voice_set_pitch_scale(0, base_pitch_scale + pitch_scale_multiplier * thrust.get_value())
	if (!is_voice_active(0)):
		play('thrust')

