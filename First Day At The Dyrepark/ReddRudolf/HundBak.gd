extends CharacterBody2D

var jump_velocity : float = 600
var gravity : float = 1000

@onready var hund_foran : CharacterBody2D = $"../HundForan"
var dog_anim

func _ready():
	dog_anim = get_node("Dog_Anim")

func _process(delta):
	# Jumping and gravity
	if Input.is_action_pressed("up") and hund_foran.is_on_floor():
		await get_tree().create_timer(0.2).timeout
		velocity.y -= jump_velocity
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
