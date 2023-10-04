extends Area2D
class_name Dyr

@export var move_speed : float = 200
var activate_input : bool = false

func _ready():
	position = Vector2(-700, 0)
	
func _process(delta):
	walk_on_screen(delta)
	
# Makes the animal walk to the centre of the screen
func walk_on_screen(delta):
	if position.x <= 0:
		position.x += move_speed * delta
		return
	activate_input = true
	
# Makes the animal walk offscreen and then despawn
func walk_off_screen(delta):
	if position.x <= 700 and position.x >= 0:
		position.x += move_speed * delta
		return
		
	if position.x >= 700:
		despawn()

func despawn():
	queue_free()
