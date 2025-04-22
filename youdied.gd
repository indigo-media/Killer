extends CanvasLayer


func _ready() -> void:
	$Respawn.grab_focus()
	Music._stop()

func _on_exit_to_main_menu_pressed() -> void:
	get_tree().paused = false
	TransitionFull.transition("res://Title.tscn")
	queue_free()


func _on_respawn_pressed() -> void:
	get_tree().paused = false
	var file = FileAccess.open("user://save_game%d.dat" %Gamedata.savedgame, FileAccess.READ)
	if file:
		var Destination = file.get_line() 
		TransitionFull.transition(Destination)
	else:
		TransitionFull.transition("res://Bedroom.tscn")
	queue_free()
	Gamedata.Health = 9
