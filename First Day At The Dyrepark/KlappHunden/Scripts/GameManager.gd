extends Node2D



var dog_scene = preload("res://KlappHunden/Scenes/Dog.tscn")
var bear_scene = preload("res://KlappHunden/Scenes/Bear.tscn")

@onready var game_over_screen : VBoxContainer = $GameOverScreen
@onready var score_text : Label = $ScoreText
@onready var game_over_score_text : Label = $GameOverScreen/GameOverScoreText

var is_game_active : bool = true
var score : int = 0

# Spawns animals randomly based on the timer timeout
func _on_animal_spawn_timer_timeout():
	if is_game_active:
		var dog = dog_scene.instantiate()
		var bear = bear_scene.instantiate()
		var animals : Array = [dog, bear]
			
		add_child(animals[randi_range(0, 1)])

# Adds score and updates the score text
func add_score(amount):
	score += amount
	score_text.text = str("SCORE: ", score)

func game_over():
	score_text.hide()
	game_over_score_text.text = score_text.text
	game_over_screen.show()
	is_game_active = false

func _on_restart_game_button_down():
	get_tree().reload_current_scene()
