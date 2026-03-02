extends Node2D


func _on_grab_area_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		$Sprite2D.play("pick up")
		Dialogic.start(preload("res://hammer.dtl"))
		await get_tree().create_timer(1.4).timeout
		$Sprite2D.visible = false
		call_deferred("queue_free")
		Inventory.hammerShow()
