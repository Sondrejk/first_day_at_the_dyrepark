extends Sprite2D

var possible_dance_moves : Array = ["Left", "Right", "Up", "Down"]
var bear_dance_moves : Array
var time_between_moves : float = 1.0
var start_position : Vector2 = Vector2(0, 0)

# Function to append a random dance move from the possible ones to the bear dance move list
func add_random_dance_move():
	bear_dance_moves.append(possible_dance_moves[randi_range(0, len(possible_dance_moves)-1)])

func perform_dance_moves():
	for move in bear_dance_moves:
		if move == "Up":
			position.y -= 30
		elif move == "Down":
			position.y += 30
		elif move == "Left":
			position.x -= 30
		elif move == "Right":
			position.x += 30
		await get_tree().create_timer(time_between_moves).timeout
		position = start_position
		await get_tree().create_timer(time_between_moves).timeout

func _process(delta):
	await add_random_dance_move()
	await perform_dance_moves()
