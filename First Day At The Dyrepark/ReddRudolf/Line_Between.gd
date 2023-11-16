extends Line2D

@onready var p1 = $"../ReddRudolfSlede"
@onready var p2 = $"../HundBak"
@onready var p3 = $"../HundForan"


func _process(delta):
	points[0] = p1.global_position + Vector2(100,20)
	points[1] = p2.global_position + Vector2(30,-20)
	points[2] = p3.global_position + Vector2(30,-25)
	
	pass
