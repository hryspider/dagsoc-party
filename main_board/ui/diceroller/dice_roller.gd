extends Node3D

@export var dice : Array[Die]
@onready var output = $Output

const SPACING = 10
var result = 0
var dice_waiting_on

func _ready():
	#return
	var length = len(dice)
	dice_waiting_on = length
	var pos = (0.5-length*0.5) *SPACING
	for i in dice:
		i.dice_output.connect(add_to_result, 1)
		i.initial_pos = Vector3(pos, 0, 0)
		i.position = i.initial_pos
		pos += SPACING
		

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		for i in dice:
			i.trigger()
			await get_tree().create_timer(0.1).timeout

func add_to_result(val):
	result += val
	dice_waiting_on -= 1
	output.text = str(result)
