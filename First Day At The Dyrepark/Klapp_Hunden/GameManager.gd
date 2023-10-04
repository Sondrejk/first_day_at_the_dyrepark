extends Node2D

var dog_scene = preload("res://Klapp_Hunden/Dog.tscn")
var score : int = 0	

func spawn_animal():
	var dog : Dyr = dog_scene.instantiate()
	add_child(dog)
	

func _on_spawn_timer_timeout():
	spawn_animal()
