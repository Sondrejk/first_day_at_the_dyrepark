extends Animal

func _process(delta):	
	if activate_input == false:
		walk(delta)
	if is_equal_approx(position.x, 0):
		activate_input = true
		if Input.is_key_label_pressed(KEY_O):
			activate_input = false
	if position.x > 700:
		despawn()
	
