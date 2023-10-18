extends Animal

func _process(delta):
	move_speed = start_speed * game_manager.game_speed
	if position.x >= 700:
		despawn()
	if walk_to_target(delta, 0) and Input.is_key_label_pressed(KEY_O):
		game_manager.add_score(1)
		walk(delta)
	elif walk_to_target(delta, 0) and Input.is_key_label_pressed(KEY_I):
		game_manager.game_over()
		
	if not game_manager.is_game_active:
		despawn()
