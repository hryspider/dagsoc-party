extends Control
const MINIGAME_VIEWER_PREVIEW = preload("uid://ejohq3nlofgq")
@onready var v_box_container = $ScrollContainer/VBoxContainer
@onready var fails = $Fails

func _ready():
	for data in Global.load_minigames():
		var preview_inst = MINIGAME_VIEWER_PREVIEW.instantiate()
		v_box_container.add_child(preview_inst)
		preview_inst.data = data
			#preview_inst.directory.text = "In folder %s" % i
