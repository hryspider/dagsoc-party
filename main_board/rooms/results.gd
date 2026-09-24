extends Control
const RESULT_PLAYER_VISUAL = preload("uid://bev0ggf6qrth2")

@onready var h_box_container = $HBoxContainer
@onready var continue_prompt = $"Continue Prompt"

func _ready():
	var place = 0
	for i in Global.rankings:
		var result_inst = RESULT_PLAYER_VISUAL.instantiate()
		result_inst.place = place
		result_inst.player = i
		h_box_container.add_child(result_inst)
		place += 1


func _on_timer_timeout():
	continue_prompt.show()

func _input(event):
	if continue_prompt.visible and (event.is_action_pressed("p1_button_bottom") or event.is_action_pressed("ui_accept")):
		Transition.transition_to("res://main_board/rooms/board.tscn")
