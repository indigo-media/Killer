extends Node2D

var isTriggered = false

@export var killerPath: Path2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		if isTriggered == false:
			$AnimatedSprite2D.play("Sideways")
			isTriggered = true
			$AudioStreamPlayer.play()
			$AudioStreamPlayer2.play()
			killerPath.activate()
			killerPath.speed = killerPath.speed*2
