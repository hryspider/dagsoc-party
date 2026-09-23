extends Control
const RESULT_PLAYER_VISUAL = preload("uid://bev0ggf6qrth2")

@onready var h_box_container = $HBoxContainer

func _ready():
	var place = 0
	for i in Global.rankings:
		var result_inst = RESULT_PLAYER_VISUAL.instantiate()
		result_inst.place = place
		result_inst.player = i
		h_box_container.add_child(result_inst)
		place += 1
