extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		Dialogic.start(preload("res://NoteThe2.dtl"))
