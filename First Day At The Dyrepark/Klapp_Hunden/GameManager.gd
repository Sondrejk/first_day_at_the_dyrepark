extends Node2D

var dog_scene = preload("res://Klapp_Hunden/Dog.tscn")
var bear_scene = preload("res://Klapp_Hunden/Bear.tscn")
@onready var timer : Timer = get_node("Spawn_timer")
var score : int = 0
var game_speed : float = 1
var time_start : float = Time.get_unix_time_from_system()

func _process(delta):
	
	# Increases difficulty by increasing movespeed and decreasing spawntime
	var current_time : float = Time.get_unix_time_from_system()
	game_speed += 0.05 * delta
	timer.wait_time = 75 /((current_time - time_start) + 25)

func spawn_animal():
	var bear : Area2D = bear_scene.instantiate()
	var dog : Area2D = dog_scene.instantiate()
	var animals : Array = [bear, dog]
	add_child(animals[randi_range(0,1)])
	
	
func _on_spawn_timer_timeout():
	spawn_animal()

func game_over():
	pass
