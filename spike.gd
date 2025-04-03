extends Node2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
			var clone = preload("res://Youdied.tscn").instantiate()
			get_tree().root.add_child(clone)
			get_tree().paused = true
