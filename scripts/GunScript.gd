extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var countdown
export var fireRate = 0.2;
func _ready():
	countdown = fireRate
	set_fixed_process(true)
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _fixed_process(delta):
	countdown -= delta
	if(countdown<=0):
		createBullet(get_global_pos(),get_global_transform().get_rotation())
		countdown = fireRate
	
func createBullet(position,rotation):
	var bulletPrefab = load("res://prefabs/Bullet.tscn")
	var bullet = bulletPrefab.instance()
	get_tree().get_root().add_child(bullet)
	bullet.set_pos(position)
	bullet.set_rot(rotation)
	bullet.activate(3000)
	pass