extends Node2D

enum room_state {roomIsDark, roomIsLit}
@export var candle: Node2D
@export var darkness: Node2D
var mat

func _ready() -> void:
	Dialogic.start(preload("res://lightsOut.dtl"))
	if Gamedata.hasCandle > 0:
		candle.visible = true
		$Guy/TheRealDarkness.visible = false
		$Guy/Darkness.visible = true
		Gamedata.hasCandle -= 1
	else:
		candle.visible = false
		$Guy/Darkness.visible = false
		$Guy/TheRealDarkness.visible = true
	
