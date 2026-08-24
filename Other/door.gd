extends Node2D
@export_file("*.tscn") var Destination: String 

var locked = false

func _on_interactable_interacted() -> void:
	if locked == false:
		await $Interactable/Prompt.animation_finished
		TransitionFull.transition(Destination)
