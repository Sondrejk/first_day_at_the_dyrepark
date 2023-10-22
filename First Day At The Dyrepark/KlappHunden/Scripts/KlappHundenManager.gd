extends Node2D

# References to scenes
var dog_scene = preload("res://KlappHunden/Scenes/Dog.tscn")
var bear_scene = preload("res://KlappHunden/Scenes/Bear.tscn")
var particle_scene = preload("res://KlappHunden/Scenes/KlappHundenParticleExplosion.tscn")

# References to files
@export_file("*.tscn") var dyrehage_scene

# References to other nodes
@onready var game_over_screen : VBoxContainer = $GameOverScreen
@onready var score_text : Label = $ScoreText
@onready var game_over_score_text : Label = $GameOverScreen/GameOverScoreText
@onready var spawn_timer : Timer = $AnimalSpawnTimer

var is_game_active : bool = true
var score : int = 0
var game_speed : float = 1

# Used to calculate total gametime
var start_time = Time.get_unix_time_from_system()

# Spawns animals randomly based on the timer timeout
func _on_animal_spawn_timer_timeout():
	if is_game_active:
		var dog = dog_scene.instantiate()
		var bear = bear_scene.instantiate()
		var animals : Array = [dog, dog, bear]
			
		add_child(animals[randi_range(0, 2)])
		
func _process(_delta):
	# Calculates the total gametime for the difficulty scaling below
	var current_time = Time.get_unix_time_from_system()
	var game_time = current_time - start_time
	
	# Difficulty scaling
	spawn_timer.wait_time = 75/(game_time + 25)
	game_speed = 0.02 * game_time + 1
	
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

func _on_quit_to_dyrehage_button_down():
	get_tree().change_scene_to_file(dyrehage_scene)

# Spawns the star explosion particle effect at a position
func spawn_particle_explosion(position : Vector2):
	var particle_explosion_instance = particle_scene.instantiate()
	particle_explosion_instance.global_position = position
	add_child(particle_explosion_instance)
