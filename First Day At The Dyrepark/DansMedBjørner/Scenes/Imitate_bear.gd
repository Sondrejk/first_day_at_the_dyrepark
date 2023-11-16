extends Sprite2D


func _process(delta):
	if Input.is_action_pressed("right"):
		frame = 1
	elif Input.is_action_pressed("left"):
		frame = 2
	elif Input.is_action_pressed("up"):
		frame = 3
	elif Input.is_action_pressed("down"):
		frame = 4
	else:
		frame = 0
	
