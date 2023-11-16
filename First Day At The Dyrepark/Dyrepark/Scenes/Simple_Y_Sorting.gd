extends Sprite2D

var is_static = true

# Called when the node enters the scene tree for the first time.
func _ready():
	z_index = global_position.y
	z_as_relative = false
	if !is_static:
		set_process(true)
	else:
		set_process(false)
	pass # Replace with function body.

func _process(delta):
	z_index = global_position.y
	
