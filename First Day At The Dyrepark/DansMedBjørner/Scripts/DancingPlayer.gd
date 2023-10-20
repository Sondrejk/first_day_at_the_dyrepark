extends Node2D

@onready var bear = $"../DancingBear"	# Connection to the bear node to get the dance info
@onready var game_manager = $".."
var player_dance_moves : Array			# Growing array of the players dance moves

func _process(_delta):
	if game_manager.is_game_active:
		# Appends the moves the player does to a list
		if bear.player_turn:
			if Input.is_action_just_pressed("up"):
				player_dance_moves.append(bear.possible_dance_moves[0])
				print(player_dance_moves)
			if Input.is_action_just_pressed("down"):
				player_dance_moves.append(bear.possible_dance_moves[1])
				print(player_dance_moves)
			if Input.is_action_just_pressed("left"):
				player_dance_moves.append(bear.possible_dance_moves[2])
				print(player_dance_moves)
			if Input.is_action_just_pressed("right"):
				player_dance_moves.append(bear.possible_dance_moves[3])
				print(player_dance_moves)
			
			# Conditions to check if fance is completed or if a wrong move is done
			if player_dance_moves != []:
				if player_dance_moves == bear.bear_dance_moves:
					player_dance_moves = []
					bear.player_turn = false
					bear.add_random_dance_move()
					game_manager.add_score(1)
				elif player_dance_moves[-1] != bear.bear_dance_moves[len(player_dance_moves)-1]:
					player_dance_moves = []
					game_manager.game_over()
