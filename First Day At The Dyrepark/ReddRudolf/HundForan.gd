extends CharacterBody2D

var jump_velocity : float = 600
var gravity : float = 1000

var dog_anim

func _ready():
	dog_anim = get_node("Dog_Anim")

func _process(delta):
	
	# Jumping and gravity
	if Input.is_action_pressed("up") and is_on_floor():
		velocity.y -= jump_velocity
	#print(velocity.y + gravity * delta)
	velocity.y += gravity * delta
	if velocity.y < 8:
		dog_anim.playing_animation = "jump"
		print("jump")
	elif velocity.y > 9:
		dog_anim.playing_animation = "jump"
		print("fall")
	else:
		dog_anim.playing_animation = "walk"
		print("walk")
	
	move_and_slide()

