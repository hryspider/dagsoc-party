extends PathFollow3D

@export var target : Node3D
@onready var path : Path3D = get_parent()

func _process(delta):
	progress = path.curve.get_closest_offset(target.position)
