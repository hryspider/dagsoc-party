extends PathFollow3D

@export var target : Node3D
@onready var path : Path3D = get_parent()

func _process(delta):
	progress = lerp(progress, path.curve.get_closest_offset(target.position), 1-pow(0.1, 30*delta))
