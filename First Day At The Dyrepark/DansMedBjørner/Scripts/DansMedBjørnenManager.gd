extends Node2D

# References to files
@export_file("*.tscn") var dyrehage_scene

# Nodes
@onready var game_over_screen_node : VBoxContainer = $GameOverScreen
@onready var score_node : Label = $ScoreText
@onready var game_over_score_node : Label = $GameOverScreen/GameOverScoreText
@onready var bear : Sprite2D = $DancingBear
@onready var player : Node2D = $DancingPlayer

# Variables
var is_game_active : bool = true
var score : int = 0

func add_score(amount):
	score += amount
	score_node.text = str(score)

func game_over():
	is_game_active = false
	bear.hide()
	player.hide()
	score_node.hide()
	game_over_score_node.text = score_node.text
	game_over_screen_node.show()
	
# Game over menu buttons
func _on_restart_game_button_down():
	get_tree().reload_current_scene()

func _on_quit_to_dyrehage_button_down():
	get_tree().change_scene_to_file(dyrehage_scene)
