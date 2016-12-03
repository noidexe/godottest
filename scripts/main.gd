const start_background_draw_x = -1080
const start_background_draw_y = -1920
const width = 1080
const height = 1920
const background_columns = 3
const background_rows = 3
onready var camera = get_node("Nave/Camera2D")

func _init():
	var x = start_background_draw_x
	var y = start_background_draw_y
	for r in range(background_rows):
		for c in range(background_columns):
			instance_background_tile(x, y)
			x += width
		x = start_background_draw_x
		y += height

func instance_background_tile(x, y):
	var backgroundScene = load("res://prefabs/AsteroidTile.tscn")
	var myBackground = backgroundScene.instance()
	myBackground.set_pos(Vector2(x, y))
	add_child(myBackground)

func _ready():
	set_process(true)