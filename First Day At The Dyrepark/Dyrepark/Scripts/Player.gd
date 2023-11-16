extends CharacterBody2D

@export var move_speed : float = 200
@export var run_speed : float = 400
#@export var starting_position : Vector2 = Vector2(0, 0)

var ap
var pSprite

var state = ["idle", "front"]
var active_speed = 0

func _ready():
	
	z_as_relative = false
	#position = starting_position
	ap = get_node("AnimationPlayer")
	pSprite = get_node("Sprite")


func _physics_process(_delta):
	z_index = global_position.y
	# Movement
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("run"):
		active_speed = run_speed
		state[0] = "run"
		ap.speed_scale = 4
	else:
		active_speed = move_speed
		state[0] = "walk"
		ap.speed_scale = 2
		
	
	if Input.is_action_pressed("up"):
		velocity.y = -active_speed
		state[1] = "back"
	if Input.is_action_pressed("down"):
		velocity.y = active_speed
		state[1] = "front"
	if Input.is_action_pressed("left"):
		velocity.x = -active_speed
		state[1] = "side"
		pSprite.flip_h = true
	if Input.is_action_pressed("right"):
		velocity.x = active_speed
		state[1] = "side"
		pSprite.flip_h = false
	
	if velocity == Vector2.ZERO:
		state[0] = "idle"
	
	move_and_slide()
	run_animation()

func am_player(): #function used as indicator
	pass

func run_animation():
	if state == ["idle", "front"]:
		ap.play("Front_I")
	elif state == ["walk", "front"]:
		ap.play("Front_W")
	elif state == ["run", "front"]:
		ap.play("Front_R")
	
	elif state == ["idle", "side"]:
		ap.play("Side_I")
	elif state == ["walk", "side"]:
		ap.play("Side_W")
	elif state == ["run", "side"]:
		ap.play("Side_R")
	
	elif state == ["idle", "back"]:
		ap.play("Back_I")
	elif state == ["walk", "back"]:
		ap.play("Back_W")
	elif state == ["run", "back"]:
		ap.play("Back_R")
	
