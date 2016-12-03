extends Area2D

const asteroid_amount = 400
const columns = 20
const rows = 20
const width = 1080
const height = 1920
const min_distance = 30

func _init():
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
	var asteroidScene = load("res://prefabs/Asteroid.tscn")
	var myAsteroid = asteroidScene.instance()
	myAsteroid.set_pos(Vector2(x + deltaX, y + deltaY))
	add_child(myAsteroid)