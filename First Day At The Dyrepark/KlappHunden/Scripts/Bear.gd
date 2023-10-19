extends Animal

func _ready():
	position = start_position

func _process(delta):
	# Difficulty speed scaling
	move_speed = start_speed * game_manager.game_speed
	
	# Movement logic
	if position.x > 700:
		despawn()
	elif walk_to_target(delta, 0) and Input.is_key_label_pressed(KEY_O):
		walk(delta)
		game_manager.add_score(1)
	elif walk_to_target(delta, 0) and Input.is_key_label_pressed(KEY_I):
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
