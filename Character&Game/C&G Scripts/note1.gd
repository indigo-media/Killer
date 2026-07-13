extends Area2D

@export var Note:AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		Note.play("default")
		Note.visible=true
		await Note.animation_finished
		Dialogic.start(preload("uid://b88o5yjwp5oau"))
func _input(event: InputEvent) -> void: 
	if event.is_action_pressed("Interact"):
		Note.visible=false
