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
var game_active = true


func _on_obstacle_spawn_timer_timeout():
	var obstacle_instance = obstacle_scene.instantiate()
	add_child(obstacle_instance)

func _process(delta):
	if game_active:
		game_time += delta
		game_speed = 0.02 * game_time + 1
		spawn_timer.wait_time = 75/(game_time + 25)
	else:
		if (Input.is_key_label_pressed(KEY_I) or Input.is_joy_button_pressed(0, JOY_BUTTON_B)):
			get_tree().reload_current_scene()
		elif (Input.is_key_label_pressed(KEY_O) or Input.is_joy_button_pressed(0, JOY_BUTTON_Y)):
			get_tree().change_scene_to_file(dyrehage_scene)

func addscore(num):
	score += num
	score_text.text = str("SCORE: ", score)

func game_over():
	player.hide()
	score_text.hide()
	game_over_score_text.text = score_text.text
	spawn_timer.stop()
	game_over_screen.show()
	game_active = false
	game_speed = 0



func _on_restart_game_button_down():
	get_tree().reload_current_scene()

func _on_quit_to_dyrehage_button_down():
	get_tree().change_scene_to_file(dyrehage_scene)
