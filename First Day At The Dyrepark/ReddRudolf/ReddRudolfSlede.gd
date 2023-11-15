extends CharacterBody2D

var jump_velocity : float = 600
var gravity : float = 1000

@onready var hund_foran : CharacterBody2D = $"../HundForan"

func _process(delta):
	
	# Jumping and gravity
	if (Input.is_action_pressed("up") or Input.is_joy_button_pressed(0, JOY_BUTTON_B)) and hund_foran.is_on_floor():
		await get_tree().create_timer(0.4).timeout
		velocity.y -= jump_velocity
	velocity.y += gravity * delta
	move_and_slide()
