extends Node
const SPACE = preload("uid://bg4yj0u1mh8ic")
const MOVE_SPACE = preload("uid://rlpqpdee7cfq")
const DICE_ROLLER = preload("uid://opq7dn6lagp")
const GOLD_DIE = preload("uid://bfxbr3abr5o46")
const REGULAR_DIE = preload("uid://dll1k7kmi8sn0")

@export var string_data: String
@export var path : Path3D


func _ready():
	add_spaces_from_str(string_data)
	roll_dice()
	

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

func roll_dice():
	var dice = DICE_ROLLER.instantiate()
	dice.die_list = []
	dice.action = "ui_accept"
	add_child(dice)
