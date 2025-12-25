extends Node

signal playerDied

func emit_on_player_death() -> void:
	playerDied.emit()
