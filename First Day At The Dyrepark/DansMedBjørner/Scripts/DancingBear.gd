extends Sprite2D

# Nodes
@onready var game_manager = $".."

# Variables
@export var possible_dance_moves : Array = ["Up", "Down", "Left", "Right"]		# Constant array of the possible moves to be added to the dance
@export var bear_dance_moves : Array			# Growing array that decides the moves in the dance
@export var player_turn : bool = false			# Decides if the player should get input
var start_position : Vector2 = Vector2(0, 0)	# Starting position
var number_of_executed_moves : int = 0			# The number of moves in the current dance done
var idle_next_move : bool = false				# Decides if the next move should be idle
var time_between_moves : float = 0.5			# Time between each move
var time_between_dances : float = 2.0			# Time between each dance
var timer : float = time_between_dances			# Timer that enables the loop in the process function


# Function to append a random dance move from the possible ones to the bear dance move list
func add_random_dance_move(num : int):
	for i in num:
		bear_dance_moves.append(possible_dance_moves[randi_range(0, len(possible_dance_moves)-1)])

# Executes a certain move given a list and number
func execute_move(list_of_moves, num):
	if list_of_moves[num-1] == possible_dance_moves[0]:
		frame = 4
	if list_of_moves[num-1] == possible_dance_moves[1]:
		frame = 1
	if list_of_moves[num-1] == possible_dance_moves[2]:
		frame = 3
	if list_of_moves[num-1] == possible_dance_moves[3]:
		frame = 2

func _ready():
	add_random_dance_move(1)

func _process(delta):
	if game_manager.is_game_active:
		if not player_turn:
			# Timer for executing moves every second
			timer -=delta
			
			if timer <= 0:
				# Resetting after a dance is finished and adds another move to the list
				if number_of_executed_moves == len(bear_dance_moves):
					frame = 0
					timer = time_between_dances
					number_of_executed_moves = 0
					player_turn = true
				# Idles for a second before the next move
				elif idle_next_move:
					frame = 0
					idle_next_move = false
					timer = time_between_moves
				# Executes the next dance move in the list
				else:
					execute_move(bear_dance_moves, number_of_executed_moves+1)
					number_of_executed_moves += 1
					idle_next_move = true
					timer = time_between_moves
