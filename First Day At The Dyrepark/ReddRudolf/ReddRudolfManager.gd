extends Node2D

# References to files
@export_file("*.tscn") var dyrehage_scene

# References to scenes
var obstacle_scene = preload("res://ReddRudolf/ReddRudolfObstacle.tscn")

func _on_obstacle_spawn_timer_timeout():
	var obstacle_instance = obstacle_scene.instantiate()
	add_child(obstacle_instance)


func _on_quit_to_dyrehage_button_down():
	get_tree().change_scene_to_file(dyrehage_scene)

func _on_restart_game_button_down():
	get_tree().reload_current_scene()


