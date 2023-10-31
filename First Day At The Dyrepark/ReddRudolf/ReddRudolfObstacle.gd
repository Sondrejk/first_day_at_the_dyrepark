extends Area2D

var start_position : Vector2 = Vector2(800, 17)
var move_speed : float = 500
var given_score : bool = false

@onready var player = $"../ReddRudolfPlayer"
@onready var game_manager = $".."


# Called when the node enters the scene tree for the first time.
func _ready():
	position = start_position
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= move_speed * delta
	if global_position.x <= player.position.x:
		given_score = true
		game_manager.addscore(1)
