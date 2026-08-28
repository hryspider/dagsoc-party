extends Button

@export var scene_path : String

func _ready():
	pressed.connect(to_scene)


func to_scene():
	get_tree().change_scene_to_file(scene_path)
