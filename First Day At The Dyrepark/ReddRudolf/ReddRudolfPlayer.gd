extends CharacterBody2D

var jump_velocity : float = 100
var gravity : float = 20

func _process(delta):
	if Input.is_action_pressed("up"):
		velocity.y -= jump_velocity
	velocity.y += gravity * delta
