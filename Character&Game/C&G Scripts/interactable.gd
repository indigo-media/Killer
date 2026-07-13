extends Area2D
signal Interacted

func _ready() -> void:
	$PanelContainer.visible = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		$PanelContainer.visible = true
		

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Guy":
		$PanelContainer.visible = false
		
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		if $PanelContainer.visible == true:
			Interacted.emit()
