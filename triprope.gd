extends Node2D

var isTriggered = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		if isTriggered == false:
			$AnimatedSprite2D.play("Sideways")
			isTriggered = true
			$AudioStreamPlayer.play()
			$AudioStreamPlayer2.play()
			$Timer.start()
			Heartbeat.start()

func _on_timer_timeout() -> void:
	$Path2D2/PathFollow2D/Vampire.setactive()
	$Path2D2/PathFollow2D/Vampire.visible = true
	var tween = create_tween()
	tween.tween_method(
		func(value):
			$Path2D2/PathFollow2D.progress_ratio = value,
			0.0,1.0,2.0
	)
	$Path2D2/PathFollow2D/Vampire/AnimatedSprite2D.play("Right")
	if $Path2D2/PathFollow2D.progress_ratio == 1:
		$Path2D2/PathFollow2D/Vampire.visible = false
		$StaticBody2D/Door.locked = false
		$StaticBody2D/Door2.locked = false
		Heartbeat.end()
