extends Area2D
class_name Animal

@export var move_speed : float = 200
@onready var game_manager : Node2D = get_node("/root/Klapp_hunden")
var activate_input : bool = false
var animal_petted : bool = false
var bear_petted : bool = false
var animal_not_petted : bool = false

func _ready():
	position = Vector2(-700, 0)
	
	# Increases movespeed based on time
	move_speed *= game_manager.game_speed
	
# Makes the animal walk to the centre of the screen
func walk_on_screen(delta):
	if position.x <= 0:
		position.x += move_speed * delta
		return
	activate_input = true
	
# Makes the animal walk offscreen and then despawn
func walk_off_screen(delta):
	if position.x <= 700:
		position.x += move_speed * delta
		return
	despawn()
	
func despawn():
	queue_free()

func _on_area_entered(area):
	get_tree().reload_current_scene()
