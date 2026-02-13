extends AnimatedSprite2D




func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		Gamedata.hasCandle += 1
		self.visible = false
		Dialogic.start(preload("res://candle.dtl"))
