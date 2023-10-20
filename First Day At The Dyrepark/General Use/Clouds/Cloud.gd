extends Node2D


@export var scale_range = Vector2(4, 8) # The clouds scale will vary between x and y
@export var speed = 0.5					# Base speed for the cloud
@export var speed_to_scale = 1.2 		# Bigger clouds will move faster
@export_enum("RIGHT", "LEFT") var direction = "LEFT"
@export var start_pos = 800
@export var height = Vector2(-430, -250)

var c_sprite
var rng = RandomNumberGenerator.new()
var size_in_percent # How big is the cloud in scale of scale_range.x to scale_range.y

func renew():
	rng.randomize()
	c_sprite.frame = rng.randi_range(0, c_sprite.hframes-1)
	var tmp = rng.randi_range(scale_range.x, scale_range.y)
	c_sprite.scale = Vector2(tmp, tmp)
	size_in_percent = float(tmp) / float(scale_range.y)
	
	if get_direction() == 1:
		global_position = Vector2(-start_pos, rng.randi_range(height.x, height.y))
	elif get_direction() == -1:
		global_position = Vector2(start_pos, rng.randi_range(height.x, height.y))


func _ready():
	c_sprite = get_node("CloudsSpritesheet")
	rng.randomize()
	c_sprite.frame = rng.randi_range(0, c_sprite.hframes-1)
	var tmp = rng.randi_range(scale_range.x, scale_range.y)
	c_sprite.scale = Vector2(tmp, tmp)
	size_in_percent = float(tmp) / float(scale_range.y)
	
	

func get_direction():
	if direction == "LEFT":
		return(-1)
	return(1)

func _process(delta):
	position.x += speed * delta * 60 * get_direction() * size_in_percent
	if get_direction() == 1:
		if global_position.x > start_pos:
			renew()#get_parent().remove_child(self)
	elif get_direction() == -1:
		if global_position.x < -start_pos:
			renew()#get_parent().remove_child(self)
		
	pass
