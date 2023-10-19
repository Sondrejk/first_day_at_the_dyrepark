extends Area2D

# Reference to minigame scene
@export_file("*.tscn") var minigame_scene

# Boolean that changes depending on if player is in area
var is_player_in_trigger : bool = false

func _on_body_entered(_body):
	is_player_in_trigger = true

func _on_body_exited(_body):
	is_player_in_trigger = false

# Changes scene if the correct button is pressed
func _process(_delta):
	if is_player_in_trigger and Input.is_key_label_pressed(KEY_I):
		get_tree().change_scene_to_file(minigame_scene)
