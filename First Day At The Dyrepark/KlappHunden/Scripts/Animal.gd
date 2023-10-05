extends Area2D
class_name Animal

@onready var game_manager : Node2D = get_node("/root/KlappHunden")
@export var move_speed : float = 200
var start_position = Vector2(-700, 20)

# When spawned, starts at the starting position
func _ready():
	position = start_position
	

# Moves the animal across the screen, can give exact x position
func walk(delta : float, target : float):
	# Moves the animal to the exact target x coordinate, if its close enough
	if abs(position.x - target) < move_speed * delta:
		position.x = target
		return true
	# Moves the animal to the right if it isnt
	elif position.x != target:
		position.x += move_speed * delta

func despawn():
	queue_free()

func _on_area_entered(area):
	game_manager.game_over()
