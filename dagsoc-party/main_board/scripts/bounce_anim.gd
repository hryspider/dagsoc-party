extends Node2D

@export var start_height : int = 1000
@export var wait_time = 0.0
var initial_position
const GRAV = 2000
var vel = 0
var bounces_left = 5

func _ready():
	initial_position = position.y
	position.y -= start_height

func _process(delta):
	if wait_time <= 0:
		if bounces_left > 0:
			vel += delta * GRAV
			position.y += vel * delta
			if position.y > initial_position:
				bounces_left -= 1
				vel = -abs(vel*0.5)
				position.y = initial_position - 1
	else:
		wait_time -= delta
