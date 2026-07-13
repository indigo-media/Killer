extends Area2D
@export_file("*.tscn") var Destination: String 

var locked = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		if locked == false:
			TransitionFull.transition(Destination)
