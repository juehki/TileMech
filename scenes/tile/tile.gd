extends Area2D
class_name Tile

@onready var animation_player: AnimationPlayer = $redTile/AnimationPlayer
@onready var red_tile: Sprite2D = $redTile

var playerInside: bool = false
var tileId: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func startRedGrow() -> void:
	red_tile.show()
	animation_player.play("redTileGrow")

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		playerInside = true
		#startRedGrow()

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		playerInside = false
	
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	red_tile.hide()
	if playerInside:
		print('game over')
