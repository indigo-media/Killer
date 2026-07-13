extends Area2D

@export var Note:AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		Note.play("default")
		Note.visible=true
		await Note.animation_finished
		Dialogic.start(preload("res://addons/dialogic/BloodyNote.dtl"))
func _input(event: InputEvent) -> void: 
	if event.is_action_pressed("Interact"):
		Note.visible=false
