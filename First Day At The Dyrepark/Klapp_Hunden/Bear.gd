extends Animal

func _process(delta):	
	walk_on_screen(delta)
	if activate_input and Input.is_key_label_pressed(KEY_O):
		animal_not_petted = true
	if animal_not_petted == true:
		animal_not_petted == false
		walk_off_screen(delta)
