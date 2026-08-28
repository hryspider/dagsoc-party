extends Node

@export var path : Path3D
@export var spaces : Array[BaseSpace]


func _ready():
	var len = len(spaces)
	for s in spaces:
		
