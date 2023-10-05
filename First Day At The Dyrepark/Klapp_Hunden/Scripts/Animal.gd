extends Area2D
class_name Animal

@export var move_speed : float = 200
@onready var game_manager : Node2D = get_node("/root/Klapp_hunden")
var activate_input : bool = false
var animal_success : bool = false

func _ready():
	position = Vector2(-700, 0)
	
	# Increases movespeed based on time
	move_speed *= game_manager.game_speed
	
# Makes the animal walk to the centre of the screen
func walk(delta):
		position.x += move_speed * delta
	
func despawn():
	queue_free()

func _on_area_entered(area):
	game_manager.game_over()

func wrong_pet():
	game_manager.game_over()
