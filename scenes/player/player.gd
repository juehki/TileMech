extends CharacterBody2D
class_name Player

const SPEED: float = 600.0
var clickLoc: Vector2
var targetLoc: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	clickLoc = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("rclick-move"):
		clickLoc = get_global_mouse_position()	
	#print(position)
	
#	https://forum.godotengine.org/t/characterbody2d-position-jitters-between-two-vector2s/56181
	var direction = global_position.direction_to(clickLoc)
	var distance = global_position.distance_to(clickLoc)
	var max_speed = (distance / delta)
	velocity = min(SPEED, max_speed) * direction
	move_and_slide()
