extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start(preload("uid://bqcgu6o4tndxa"))
	await Dialogic.timeline_ended 
	TransitionFull.transition("uid://baws2r3t8klad")
