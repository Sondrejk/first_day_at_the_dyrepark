extends CharacterBody2D

var jump_velocity : float = 600
var gravity : float = 1000

var dog_anim

func _ready():
	dog_anim = get_node("Dog_Anim")

func _process(delta):
	
	# Jumping and gravity
	if (Input.is_action_pressed("up") or Input.is_joy_button_pressed(0, JOY_BUTTON_B)) and is_on_floor():
		velocity.y -= jump_velocity
	#print(velocity.y + gravity * delta)
	velocity.y += gravity * delta
	if self.is_on_floor():
		dog_anim.playing_animation = "walk"
	else:
		if velocity.y < 0:
			dog_anim.playing_animation = "jump"
		elif velocity.y > 0:
			dog_anim.playing_animation = "fall"
	
	move_and_slide()

