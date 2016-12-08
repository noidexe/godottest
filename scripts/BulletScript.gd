extends Area2D

var speed = 400
onready var sprite = get_node("Sprite")
onready var collision = get_node("Collision")
var lifetime = 0.5
func _ready():
	pass

func _fixed_process(delta):
	
	var rotation = get_global_transform().get_rotation(); 
	var position = get_pos();
	set_pos(Vector2(position.x-sin(rotation)*speed*delta,position.y-cos(rotation)*speed*delta));	
	lifetime -=delta;
	if(lifetime<0):
		self.queue_free()

func activate(_speed):
	speed = _speed
	set_fixed_process(true)
	sprite.is_visible() = true
	sprite.show()
	pass

func deactivate():
	speed = 0
	set_fixed_process(false)
	sprite.hide()
	pass

func _on_Bullet_body_enter( body ):
	print(body.get_name())
	deactivate()
	pass
