extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass


func _on_Area2D_body_enter( body ):
	if(body.get_name() == "Nave" ):
		var explosion = preload("res://prefabs/Explosion.tscn").instance()
		get_parent().add_child(explosion)
		queue_free()
