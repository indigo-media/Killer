extends Node2D
func _process(delta: float) -> void:
	if $"Kill Area".has_overlapping_bodies():
		for body in $"Kill Area".get_overlapping_bodies():
			_on_kill_area_body_entered(body)

func _on_kill_area_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		if body.ishiding == false and visible == true:
			Heartbeat.end()
			var clone = preload("res://Youdied.tscn").instantiate()
			get_tree().root.add_child(clone)
			get_tree().paused = true

func setactive ():
	$"Kill Area"/CollisionShape2D.disabled = false
