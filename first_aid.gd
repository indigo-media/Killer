extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_interactable_interacted() -> void:
	var tween = create_tween().set_parallel()
	tween.tween_property(self,"modulate",Color.TRANSPARENT,0.25)
	tween.tween_property(self,"global_position",Gamedata.player.global_position, 0.25)
	Gamedata._takeDamage(-2)
	print("healed")
