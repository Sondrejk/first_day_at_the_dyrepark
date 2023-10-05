extends Node2D

var dog_scene = preload("res://KlappHunden/Scenes/Dog.tscn")
var bear_scene = preload("res://KlappHunden/Scenes/Bear.tscn")

func _on_animal_spawn_timer_timeout():
	var dog = dog_scene.instantiate()
	var bear = bear_scene.instantiate()
	var animals : Array = [dog, bear]
		
	add_child(animals[randi_range(0, 1)])

func game_over():
	get_tree().reload_current_scene()
