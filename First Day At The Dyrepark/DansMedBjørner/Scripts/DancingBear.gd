extends Sprite2D

var possible_dance_moves : Array = ["Left", "Right", "Up", "Down"]		# Constant array of the possible moves to be added to the dance
var start_position : Vector2 = Vector2(0, 0)							# Starting position
var bear_dance_moves : Array				# Growing array that decides the moves in the dance
var executed_moves : int = 0				# The number of moves in the current dance done
var idle_next_move : bool = false			# Decides if the next move should be idle
var time_between_moves : float = 0.25		# Time between each move
var time_between_dances : float = 1.0		# Time between each dance
var timer : float = time_between_dances		# Timer that enables the loop in the process function

# Function to append a random dance move from the possible ones to the bear dance move list
func add_random_dance_move():
	bear_dance_moves.append(possible_dance_moves[randi_range(0, len(possible_dance_moves)-1)])

# Executes a certain move given a list and number
func execute_move(list_of_moves, num):
	if list_of_moves[num-1] == "Up":
		position.y -= 30
	if list_of_moves[num-1] == "Down":
		position.y += 30
	if list_of_moves[num-1] == "Left":
		position.x -= 30
	if list_of_moves[num-1] == "Right":
		position.x += 30

func _ready():
	add_random_dance_move()

func _process(delta):
	# Timer for executing moves every second
	timer -=delta
	if timer <= 0:
		# Resetting after a dance is finished and adds another move to the list
		if executed_moves == len(bear_dance_moves):
			position = start_position
			timer = time_between_dances
			executed_moves = 0
			add_random_dance_move()
		# Idles for a second before the next move
		elif idle_next_move:
			position = start_position
			idle_next_move = false
			timer = time_between_moves
		# Executes the next danve move in the list
		else:
			execute_move(bear_dance_moves, executed_moves+1)
			executed_moves += 1
			idle_next_move = true
			timer = time_between_moves
	
