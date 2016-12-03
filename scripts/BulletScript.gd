extends RigidBody2D

var speed = 200;
onready var sprite = get_node("Sprite")

func _ready():
	activate(200);
	pass

func _fixed_process(delta):
	translate(Vector2(0,-delta*200))

func activate(_speed):
	speed = _speed;
	set_fixed_process(true);
	sprite.is_visible() = true;
	sprite.show();
	pass

func handleCol(object):
	if(object.get_name() != "Enemy"):
		pass
	pass

func deactivate():
	speed = 0;
	set_fixed_process(false);
	sprite.hide();
	pass