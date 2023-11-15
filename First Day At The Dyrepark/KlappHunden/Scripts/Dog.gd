extends Animal

@onready var sprite : Sprite2D = $Sprite2D

# Loading textures
var Hund1 = preload("res://KlappHunden/Sprites/Hund_1.png")
var Hund2 = preload("res://KlappHunden/Sprites/Hund_2.png")
var Hund3 = preload("res://KlappHunden/Sprites/Hund_3.png")

@export_subgroup("Audio")
@export var event_clap : EventAsset

# Changes texture based on input number
func change_texture(num):
	if num == 1:
		sprite.texture = Hund1
	if num == 2:
		sprite.texture = Hund2
	if num == 3:
		sprite.texture = Hund3

func choose_random_size():
	scale.x = randf_range(7.5, 8.5)
	scale.y = scale.x

func _ready():
	position = start_position
	change_texture(randi_range(1, 3))
	choose_random_size()
	

func _process(delta):
	# Difficulty speed scaling
	move_speed = start_speed * game_manager.game_speed
	
	# Movement logic
	if position.x > 700:
		despawn()
	elif walk_to_target(delta, 0) and (Input.is_key_label_pressed(KEY_I) or Input.is_joy_button_pressed(0, JOY_BUTTON_B)):
		walk(delta)
		game_manager.add_score(1)
		game_manager.spawn_particle_explosion(Vector2(0, -75))
		FMODRuntime.play_one_shot(event_clap, self)
	elif walk_to_target(delta, 0) and (Input.is_key_label_pressed(KEY_O) or Input.is_joy_button_pressed(0, JOY_BUTTON_X)):
		game_manager.game_over()
		
	# Animations
	if position.x < 0:
		animation_player.play("walk_in")
	elif position.x == 0:
		animation_player.play("idle")
	elif position.x > 0:
		animation_player.play("walk_out")

	if not game_manager.is_game_active:
		despawn()
