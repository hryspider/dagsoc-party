extends RigidBody3D
class_name Die


@onready var initial_pos = position
var value_children : Array[DiceValue]= []
enum {ROLLING, DROPPING, DECIDED}
var state = ROLLING:
	set(value):
		state = value
		if state == ROLLING: angular_velocity = Vector3(randf(), randf(), randf()).normalized()*10
		else: angular_velocity *= 2
		gravity_scale = 10 if state == DROPPING else 0

signal dice_output(val)

func _ready():
	for i in get_children():
		if i is DiceValue:
			value_children.append(i)
	state = ROLLING
	rotation = Vector3(randf_range(0, 2*PI), randf_range(0, 2*PI), randf_range(0, 2*PI))

func _physics_process(delta):
	position.x = lerpf(position.x, initial_pos.x, 1-pow(0.1, 16*delta))
	position.z = lerpf(position.z, initial_pos.z, 1-pow(0.1, 16*delta))
	if state != DROPPING: position.y = lerpf(position.y, initial_pos.y, 1-pow(0.1, 16*delta))
	if Input.is_action_just_pressed("ui_cancel"): get_tree().reload_current_scene()
	#print(initial_pos)
	#position.x = initial_pos.x
	
			
		#rotate_x(delta)
		#rotate_y(delta*-2)
		#rotate_z(delta*7)
		#angle = angle.rotated(angle_rotate, delta*10)
	match state:
		#DECIDED:
			#rotation.x = lerp_angle(rotation.z, 0, 1-pow(0.1, delta))
		DROPPING:
			if linear_velocity.length() <= 0.001 and angular_velocity.length() <= 0.001:
					var max_height = global_position
					var output_value
					for i in value_children:
						var height = i.global_position.y
						if output_value == null or max_height <= height:
							output_value = i.value
							max_height = height
					emit_signal("dice_output", output_value)
					state = DECIDED
					#rotation_degrees.x += 90
			

func trigger():
	state = DROPPING
	apply_force(Vector3.UP*100000)
