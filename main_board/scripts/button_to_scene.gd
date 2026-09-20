extends Button

@export var scene_path : String

func _ready():
	pressed.connect(to_scene)


func to_scene():
	Transition.transition_to(scene_path)
