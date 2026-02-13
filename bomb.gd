extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.play("default")

func _on_area_2d_body_entered(body: Node2D) -> void:
		if body.name == "Guy":
			Dialogic.start(preload("res://yougottabomb.dtl"))
			Gamedata.hasBomb += 1
			call_deferred("queue_free")
			
