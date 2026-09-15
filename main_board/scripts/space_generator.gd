extends Node
const SPACE = preload("uid://bg4yj0u1mh8ic")
const MOVE_SPACE = preload("uid://rlpqpdee7cfq")
const DICE_ROLLER = preload("uid://opq7dn6lagp")
const GOLD_DIE = preload("uid://bfxbr3abr5o46")
const REGULAR_DIE = preload("uid://dll1k7kmi8sn0")
@onready var camera_3d = $Path3D/PathFollow3D/Camera3D
@onready var dice_roller = $Path3D/PathFollow3D/DiceRoller

@export var string_data: String
@export var path : Path3D

var space_positions : Array[Vector3] = []


func _ready():
	add_spaces_from_str(string_data)
	var result = await roll_dice()
	$PlayerPiece.jump_to_places(space_positions.slice(1, result-1))
	

func add_spaces_from_str(string):
	var i = 0
	var negative = false
	for s in string:
		var space_inst
		if s == "-":
			negative = true
			continue
		if int(s) != 0:
			space_inst = MOVE_SPACE.instantiate()
			if negative:
				space_inst.set_amount(-int(s))
			else:
				space_inst.set_amount(int(s))
		else:
			space_inst = SPACE.instantiate()
		#match s:
			#"m":
				#data = MinigameSpace.new()
			#"v":
				#data = VictorySpace.new()
				
		space_inst.transform = path.curve.sample_baked_with_rotation(i*8)
		space_inst.rotation *= Vector3(1, 0, 0)
		i += 1
		add_child(space_inst)
		space_positions.append(space_inst.position)
func roll_dice():
	dice_roller.die_list = [GOLD_DIE.instantiate(), REGULAR_DIE.instantiate(), GOLD_DIE.instantiate()]
	dice_roller.action = "ui_accept"
	dice_roller.run()
	
	dice_roller.global_rotation.y = camera_3d.global_rotation.y
	var result = await dice_roller.finished
	return result
	
	
