extends AnimatedSprite2D
@export var uniqueName: String

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		body.islocked = true
		Dialogic.start(preload("res://masterKeygottem.dtl"))
		Gamedata.MasterKey += 1
		Gamedata.keyData.append(uniqueName)
		self.play("EXPLOSION")
		await animation_finished
		queue_free()
		body.islocked = false

func _ready() -> void:
	if Gamedata.keyData.has(uniqueName):
		queue_free()
