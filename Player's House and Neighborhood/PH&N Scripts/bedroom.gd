extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	onLevel.gameState = 0
	Gamedata.levelGenral = Gamedata.Levels.NoLevel
