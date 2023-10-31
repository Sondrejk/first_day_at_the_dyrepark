extends CharacterBody2D

var jump_velocity : float = 600
var gravity : float = 1000

func _process(delta):
	
	# Jumping and gravity
	if Input.is_action_pressed("up") and is_on_floor():
		velocity.y -= jump_velocity
	velocity.y += gravity * delta
	move_and_slide()
