extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		if $Timer.is_stopped():
			Gamedata._takeDamage(1)
			$AnimatedSprite2D.play("default")
			$Timer.start()
			await $Timer.timeout
			$AnimatedSprite2D.frame = 0
