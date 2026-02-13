extends Node2D


func _on_bomb_area_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		if Gamedata.hasBomb > 0:
			Dialogic.start(preload("res://Bombhasbeenplanted.dtl"))
			Gamedata.hasBomb -= 1
			await Dialogic.timeline_ended
			$RockCorner.play("Explosion")
			await $RockCorner.animation_finished
			$StaticBody2D/CollisionShape2D.disabled = true
			$"Bomb Area/CollisionShape2D".disabled = true
			Gamedata.blownUprockwall = true
		else:
			Dialogic.start(preload("res://notyet.dtl"))

func _ready() -> void:
	$RockCorner.play("Before")
	if Gamedata.blownUprockwall:
		$StaticBody2D/CollisionShape2D.disabled = true
		$"Bomb Area/CollisionShape2D".disabled = true
		$RockCorner.play("After")
		
