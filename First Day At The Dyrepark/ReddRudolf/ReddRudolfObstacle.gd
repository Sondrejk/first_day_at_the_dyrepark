extends Area2D

var start_position : Vector2 = Vector2(800, -50)
var move_speed : float = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	position = start_position
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= move_speed * delta
