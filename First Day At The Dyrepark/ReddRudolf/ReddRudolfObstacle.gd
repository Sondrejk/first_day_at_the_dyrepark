extends Area2D

var start_position : Vector2 = Vector2(800, 17)
var start_move_speed : float = 500
var move_speed : float = start_move_speed
var given_score : bool = false

@onready var player = $"../ReddRudolfPlayer"
@onready var game_manager = $".."

func _ready():
	position = start_position
	

func _process(delta):
	move_speed = start_move_speed * game_manager.game_speed
	
	position.x -= move_speed * delta
	if global_position.x <= player.position.x and not given_score:
		given_score = true
		game_manager.addscore(1)

func _on_body_entered(_body):
	given_score = true # Because then the obstacle won't give a score after death
	hide()
	game_manager.game_over()
