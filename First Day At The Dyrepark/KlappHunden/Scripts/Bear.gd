extends Animal

func choose_random_size():
	scale.x = randf_range(7, 8)
	scale.y = scale.x

func _ready():
	position = start_position
	choose_random_size()
	
func _process(delta):
	# Difficulty speed scaling
	move_speed = start_speed * game_manager.game_speed
	
	# Movement logic
	if position.x > 700:
		despawn()
	elif walk_to_target(delta, 0) and Input.is_key_label_pressed(KEY_O):
		walk(delta)
		game_manager.add_score(1)
		game_manager.spawn_particle_explosion(Vector2(0, -75))
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
