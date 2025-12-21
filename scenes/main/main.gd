extends Node2D

@onready var tiles: Node2D = $Tiles

var tileArray: Array
var exploFuncArr: Array[Callable] = [
	consecExplosion,
	consecExploBackwards,
	moduloExplosionEven,
	moduloExplosionOdd
]

func _ready() -> void:
	tileArray = tiles.get_children()
	print(tileArray)
	var idCounter: int = 0
	for tile in tileArray:
		tile.tileId = idCounter
		idCounter += 1

func _on_skill_timer_timeout() -> void:
	var random_func: Callable = exploFuncArr.pick_random()
	random_func.call()

# functions for explosion patterns
func consecExplosion() -> void:
	print('consecExplosion')
	for tile in tileArray:
		tile.startRedGrow()
		await get_tree().create_timer(0.15).timeout

func consecExploBackwards() -> void:
	print('consecBackwards')
	for i in range(tileArray.size() - 1, -1, -1):
		tileArray[i].startRedGrow()
		await get_tree().create_timer(0.15).timeout

# remainder = 0 for even, 1 for odd
func moduloExplosionEven() -> void:
	print('moduloExplosionEven')
	for tile in tileArray:
		if tile.tileId % 2 == 0:
			tile.startRedGrow()
			
func moduloExplosionOdd() -> void:
	print('moduloExplosionOdd')
	for tile in tileArray:
		if tile.tileId % 2 == 1:
			tile.startRedGrow()
