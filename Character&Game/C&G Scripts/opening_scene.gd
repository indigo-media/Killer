extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.start(preload("res://Intro.dtl"))
	await Dialogic.timeline_ended 
	TransitionFull.transition("res://Player's House and Neighborhood/Bedroom.tscn")
