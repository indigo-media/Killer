extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Gamedata.hasHammer == false:
		return
	else:
		$Node2D3.call_deferred("queue_free")
