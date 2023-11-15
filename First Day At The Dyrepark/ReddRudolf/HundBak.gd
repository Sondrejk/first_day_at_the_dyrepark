extends CharacterBody2D

var jump_velocity : float = 600
var gravity : float = 1000

@onready var hund_foran : CharacterBody2D = $"../HundForan"
var dog_anim

func _ready():
	dog_anim = get_node("Dog_Anim")

func _process(delta):
	# Jumping and gravity
	if (Input.is_action_pressed("up") or Input.is_joy_button_pressed(0, JOY_BUTTON_B)) and hund_foran.is_on_floor():
		await get_tree().create_timer(0.2).timeout
		velocity.y -= jump_velocity
	velocity.y += gravity * delta
	
	if velocity.y < 5:
		dog_anim.playing_animation = "jump"
		print("jump")
		print(velocity.y)
	elif velocity.y > 7:
		dog_anim.playing_animation = "jump"
		print("fall")
		print(velocity.y)
	else:
		dog_anim.playing_animation = "walk"
		print("walk")
		print(velocity.y)

	move_and_slide()
