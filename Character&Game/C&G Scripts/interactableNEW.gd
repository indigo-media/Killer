extends Area2D
static var hot : Area2D
signal interacted
@export var promptText = "Open"
@export var deleteOnFinish : bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	$Label.text = promptText
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("Interact"):
		if self == hot:
			interacted.emit()
			hot = null
			$Prompt.play("default")
			await $Prompt.animation_finished
			$AnimationPlayer.play("Pressed")
			await  $AnimationPlayer.animation_finished
			if deleteOnFinish == true:
				queue_free()
			

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		hot = self
		show()
		$AnimationPlayer.play("RESET")


func _on_body_exited(body: Node2D) -> void:
	if body.name == "Guy":
		if self == hot:
			hot = null
			hide()
