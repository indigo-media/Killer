extends Node2D

func _ready() -> void:
	Gamedata.levelGenral = Gamedata.Levels.HLM
	Music._start()




func _on_mk_door_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		Dialogic.start(preload("res://MkDoorHLM.dtl"))
