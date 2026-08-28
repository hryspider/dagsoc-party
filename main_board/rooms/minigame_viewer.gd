extends Control
const MINIGAME_VIEWER_PREVIEW = preload("uid://ejohq3nlofgq")
@onready var v_box_container = $ScrollContainer/VBoxContainer
@onready var fails = $Fails

func _ready():
	var minigame_dirs = DirAccess.get_directories_at("res://minigames/")
	print(minigame_dirs)
	var load_failed_dirs = []
	for i in minigame_dirs:
		var dir = "res://minigames/" + i
		var files = DirAccess.get_files_at(dir)
		var data = null
		if files.has("data.tres"):
			data = load(dir + "/data.tres")
			if data is MinigameData:
				var preview_inst = MINIGAME_VIEWER_PREVIEW.instantiate()
				v_box_container.add_child(preview_inst)
				preview_inst.data = data
				preview_inst.directory.text = "In folder %s" % i
			else: data = null
		if data == null:
			load_failed_dirs.append(i)
	for i in load_failed_dirs:
		if fails.text == "":
			fails.text = "Failed to load:"
		fails.text += " " + i
