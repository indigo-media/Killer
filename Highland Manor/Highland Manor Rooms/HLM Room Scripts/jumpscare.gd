extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position.x = randi_range(-10,10)
	position.y = randi_range(-10,10)
	

func _on_jumpscare_01_animation_finished() -> void:
	var store = preload("res://Youdied.tscn").instantiate()
	get_tree().root.add_child(store)
