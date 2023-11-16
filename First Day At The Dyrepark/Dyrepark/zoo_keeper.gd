extends Node2D


@export var zoo_keeper_id = 1
var count = 0
@onready var tb = $Text_Bubble

var dogsledding = "res://ReddRudolf/ReddRudolf.tscn"
var pet_dog = "res://KlappHunden/Scenes/KlappHunden.tscn"
var dance = "res://DansMedBjørner/Scenes/DansMedBjørnen.tscn"

var dialogue = [
	["You must be our new employe",
	"Your tasks for the day will be...",
	"Petting the pups...",
	"Train the dogs for dogsledding...",
	"And dancing with the bear!",
	"I can get you started with Dogsledding and Petting the pups!"],
	
	["Welcome!",
	"You ready to dance?"]
]

func _ready():
	z_index = global_position.y
	z_as_relative = false
	if zoo_keeper_id == 1:
		get_node("AnimationPlayer").play("Idle")
	elif zoo_keeper_id == 2:
		get_node("AnimationPlayer").play("Idle_Woman")
		get_node("Text_Bubble/Label").text = "You ready to dance?"
		get_node("Text_Bubble/Button_ind").b[0] = [true, "I'm Ready"]
		get_node("Text_Bubble/Button_ind").b[4] = [true, "YEAH"]
		get_node("Text_Bubble/Button_ind").update()


func _process(delta):
	if is_player_close:
		
		
		tb.show()
		if zoo_keeper_id == 1:
			if (Input.is_key_label_pressed(KEY_I) or Input.is_joy_button_pressed(0, JOY_BUTTON_B)):
				get_tree().change_scene_to_file(dogsledding)
			elif (Input.is_key_label_pressed(KEY_O) or Input.is_joy_button_pressed(0, JOY_BUTTON_Y)):
				get_tree().change_scene_to_file(pet_dog)
		elif zoo_keeper_id == 2:

			if (Input.is_key_label_pressed(KEY_I) or Input.is_joy_button_pressed(0, JOY_BUTTON_B)):
				get_tree().change_scene_to_file(dance)
			elif (Input.is_key_label_pressed(KEY_O) or Input.is_joy_button_pressed(0, JOY_BUTTON_Y)):
				get_tree().change_scene_to_file(dance)
	else:
		tb.hide()
	pass


var is_player_close = false
func _on_area_2d_body_entered(body):
	if body.has_method("am_player"):
		is_player_close = true
	pass # Replace with function body.


func _on_area_2d_body_exited(body):
	if body.has_method("am_player"):
		is_player_close = false
	pass # Replace with function body.
