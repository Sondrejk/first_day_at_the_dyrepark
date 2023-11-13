extends Node2D

# References to files
@export_file("*.tscn") var dyrehage_scene

# References to scenes
var obstacle_scene = preload("res://ReddRudolf/ReddRudolfObstacle.tscn")

# References to nodes
@onready var score_text : Label = $ScoreText
@onready var player : Node2D = $ReddRudolfPlayer
@onready var game_over_screen = $GameOverScreen
@onready var game_over_score_text : Label = $GameOverScreen/GameOverScoreText
@onready var spawn_timer : Timer = $ObstacleSpawnTimer

# Variables
var score : int = 0
var game_time : float = 0
var game_speed : float = 1

func _on_obstacle_spawn_timer_timeout():
	var obstacle_instance = obstacle_scene.instantiate()
	add_child(obstacle_instance)

func _process(delta):
	game_time += delta
	game_speed = 0.02 * game_time + 1
	spawn_timer.wait_time = 75/(game_time + 25)

func addscore(num):
	score += num
	score_text.text = str("SCORE: ", score)

func game_over():
	player.hide()
	score_text.hide()
	game_over_score_text.text = score_text.text
	spawn_timer.stop()
	game_over_screen.show()

func _on_restart_game_button_down():
	get_tree().reload_current_scene()

func _on_quit_to_dyrehage_button_down():
	get_tree().change_scene_to_file(dyrehage_scene)
