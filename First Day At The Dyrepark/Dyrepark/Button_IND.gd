extends Node2D

@export var is_active = false
@export var b = [
	[true, ""],
	[false, ""],
	[false, ""],
	[false, ""],
	[true, ""],
	[false, ""],
]
@export var use_go = false



var bs = []

func update(test=""):
	print(test)
	for i in bs.size():
		bs[i].set_text(b[i][1])
			
		if b[i][0]:
			bs[i].modulate = Color(1, .3, .3)
		else:
			bs[i].modulate = Color(.3, .3, .3)
			
		

func _ready():
	for i in get_children():
		bs.append(i)
	
	if !is_active:
		set_process(false)
	
	update()

func _process(delta):
	if is_active:
		if (Input.is_key_label_pressed(KEY_I) or Input.is_joy_button_pressed(0, JOY_BUTTON_B)) and b[0][0]: #nr 1
			bs[0].modulate = Color(.3, .1, .1)
		else:
			bs[0].modulate = Color(1, .3, .3)
		
		if (Input.is_key_label_pressed(KEY_O) or Input.is_joy_button_pressed(0, JOY_BUTTON_Y)) and b[4][0]: #nr 5
			bs[4].modulate = Color(.3, .1, .1)
		else:
			bs[4].modulate = Color(1, .3, .3)

	#update()
	pass
