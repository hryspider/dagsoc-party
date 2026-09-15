extends Node3D
@onready var l_eye = $Face/LEye
@onready var r_eye = $Face/REye
@onready var nose = $Face/Nose
@onready var mouth = $Face/Mouth
@onready var face = $Face

var jumping := false
var from_pos : Vector3
var to_pos : Vector3
var progress = 0.0
signal jumping_finished
signal jumping_false

@export_range(0, 3) var player_number : int

func _ready():
	set_face(Global.player_faces[player_number])

func set_face(face : FaceData):
	l_eye.frame = face.eye_type
	r_eye.frame = face.eye_type
	nose.frame = face.nose_type
	mouth.frame = face.mouth_type

func _process(delta):
	if jumping:
		position = from_pos.lerp(to_pos, progress) + Vector3.UP * sin(progress*PI) * 2
		progress += delta*5
		if progress > 1:
			position = to_pos
			jumping = false
			emit_signal("jumping_false")

func jump_to_places(positions : Array[Vector3]):
	for pos in positions:
		jumping = true
		progress = 0
		from_pos = position
		to_pos = pos
		await jumping_false
	emit_signal("jumping_finished")
