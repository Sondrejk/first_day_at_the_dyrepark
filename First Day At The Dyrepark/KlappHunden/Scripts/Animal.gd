extends Area2D
class_name Animal

@onready var game_manager : Node2D = $".."
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@export var move_speed : float = 200
@export var petted : bool = false
var start_position = Vector2(-800, 100)

# When spawned, starts at the starting position
func _ready():
	position = start_position
	

# Moves the animal across the screen, can give exact x position
func walk_to_target(delta : float, target : float):
	# Moves the animal to the exact target x coordinate, if its close enough
	if abs(position.x - target) < move_speed * delta:
		position.x = target
		return true
	# Moves the animal to the right if it isnt
	elif position.x != target:
		position.x += move_speed * delta

# Moves the animal across the screen
func walk(delta):
	position.x += move_speed * delta

func despawn():
	queue_free()

func _on_area_entered(_area):
	game_manager.game_over()
