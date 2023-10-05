extends Animal

func _process(delta):	
	walk_on_screen(delta)
	if activate_input and Input.is_key_label_pressed(KEY_I):
		animal_petted = true
	if animal_petted == true:
		animal_petted == false
		walk_off_screen(delta)
		
func is_dog():
	pass
