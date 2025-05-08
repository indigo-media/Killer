extends CanvasLayer

func _ready() -> void:
	get_tree().paused = true
	
func _on_continue_pressed() -> void:
	get_tree().paused = false
	queue_free()

func _on_exit_pressed() -> void:
	get_tree().paused = false
	TransitionFull.transition("res://Title.tscn")
	queue_free()
