extends Node2D

func _on_chest_interacted() -> void:
	$AnimationPlayer.play("firstAidCorridor01")
