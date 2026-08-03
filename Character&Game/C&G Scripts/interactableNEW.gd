extends Area2D
static var hot : Area2D
signal interacted
@export var promptText = "Open"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()
	$PanelContainer/Label.text = promptText
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_released("Interact"):
		if self == hot:
			interacted.emit()
	
	

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		hot = self
		show()



func _on_body_exited(body: Node2D) -> void:
	if body.name == "Guy":
		if self == hot:
			hot = null
			hide()
