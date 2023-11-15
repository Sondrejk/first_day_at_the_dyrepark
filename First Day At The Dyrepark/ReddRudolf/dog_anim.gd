extends Node2D

@export var playing_animation = "walk"
var last_play = ""

func _process(delta):
	if last_play != playing_animation:
		last_play = playing_animation
		if playing_animation == "walk":
			get_node("AnimationPlayer").play("Dog Run")
		elif playing_animation == "idle":
			get_node("AnimationPlayer").play("Idle_Dog")
		elif playing_animation == "jump":
			get_node("AnimationPlayer").play("Dog Jump")
		elif playing_animation == "fall":
			get_node("AnimationPlayer").play("Dog Fall")
			

