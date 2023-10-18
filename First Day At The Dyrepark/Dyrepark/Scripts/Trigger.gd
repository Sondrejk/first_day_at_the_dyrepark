extends Area2D
@export_file("*.tscn") var minigame_scene
var is_player_in_trigger : bool = false


func _on_body_entered(body):
	is_player_in_trigger = true

func _on_body_exited(body):
	is_player_in_trigger = false
	
func _process(_delta):
	if is_player_in_trigger and Input.is_key_label_pressed(KEY_I):
		get_tree().change_scene_to_file(minigame_scene)
