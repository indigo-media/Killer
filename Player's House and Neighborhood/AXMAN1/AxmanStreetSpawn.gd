extends Area2D

func _on_body_entered(body: Node2D) -> void:
	$"../Axman".visible = true
	$"../Axman/AnimatedSprite2D/AnimationPlayer".play ("Entrance")
	body.islocked = true 
	Dialogic.start(preload("res://AxManIntro.dtl"))
	
	await Dialogic.timeline_ended 
	body.islocked = false
	$"../Axman".activated = true
	hide()
