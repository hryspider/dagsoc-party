extends Node3D
var amount : int = 0

func set_amount(value:int):
	amount = value
	$Label3D.text = "%+d" % value
	$Space.modulate = Color(0.312, 0.8, 0.312, 1.0) if value > 0 else Color(0.8, 0.256, 0.265, 1.0)
