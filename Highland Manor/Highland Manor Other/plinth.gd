extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		Dialogic.start(preload("res://Plinth1.dtl"))
