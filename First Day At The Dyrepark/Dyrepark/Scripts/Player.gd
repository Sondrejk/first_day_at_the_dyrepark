extends CharacterBody2D

@export var move_speed : float = 200
@export var starting_position : Vector2 = Vector2(0, 0)

func _ready():
	position = starting_position

func _physics_process(delta):
	# Movement
	velocity = Vector2.ZERO
	if Input.is_action_pressed("up"):
		velocity.y = -move_speed
	if Input.is_action_pressed("down"):
		velocity.y = move_speed
	if Input.is_action_pressed("left"):
		velocity.x = -move_speed
	if Input.is_action_pressed("right"):
		velocity.x = move_speed
	move_and_slide()
	
