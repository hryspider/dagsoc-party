extends Node3D
@onready var l_eye = $Face/LEye
@onready var r_eye = $Face/REye
@onready var nose = $Face/Nose
@onready var mouth = $Face/Mouth
@onready var face = $Face

@export_range(0, 3) var player_number : int

func _ready():
	set_face(Global.player_faces[player_number])

func set_face(face : FaceData):
	l_eye.frame = face.eye_type
	r_eye.frame = face.eye_type
	nose.frame = face.nose_type
	mouth.frame = face.mouth_type
