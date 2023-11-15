extends ParallaxBackground

@export var scroll_speed = 40

func _process(delta):
	scroll_base_offset.x -= scroll_speed*delta*get_parent().game_speed
