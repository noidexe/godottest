extends Area2D

const asteroid_amount = 400
const columns = 10
const rows = 10
const width = 1080
const height = 1920
const min_distance = 150
var texs = []

func _init():
	for t in range(4):
		var tex_name = "res://images/estrella_" + str(t + 1) + ".png"		
		texs.append( load(tex_name) )

	var x_step = width / columns
	var y_step = height / rows
	var x = x_step
	var y = y_step
	for i in range(rows):
		for j in range(columns):
			instance_asteroid(x, y)
			x+= x_step
		x = x_step
		y += y_step

func instance_asteroid(x, y):
	var deltaX = rand_range(-1, 1) * min_distance
	var deltaY = rand_range(-1, 1) * min_distance
	var textureId = floor( rand_range(0, 4) )
	if textureId == 4:
		textureId = 3

	var asteroidScene = load("res://prefabs/Asteroid.tscn")
	var myAsteroid = asteroidScene.instance()
	myAsteroid.set_texture(texs[textureId])
	myAsteroid.set_pos(Vector2(x + deltaX, y + deltaY))
	var scale = rand_range(-0.5, 2)
	myAsteroid.set_scale(Vector2(scale, scale))
	add_child(myAsteroid)