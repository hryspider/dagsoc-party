extends Control
@onready var title = $HBoxContainer/VBoxContainer/Title
@onready var author = $HBoxContainer/VBoxContainer/Author
@onready var directory = $HBoxContainer/VBoxContainer/Directory
@onready var scene = $HBoxContainer/VBoxContainer/Scene
@onready var description = $HBoxContainer/Description

var data : MinigameData:
	set(value):
		data = value
		title.text = value.title
		author.text = "by %s" % value.author
		scene.text = "Loads up %s" % value.main_scene_path
		description.text = value.description
