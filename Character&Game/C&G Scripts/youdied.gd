extends CanvasLayer


func _ready() -> void:
	onLevel.gameState = -1
	$Respawn.grab_focus()
	Music._stop()

func _on_exit_to_main_menu_pressed() -> void:
	get_tree().paused = false
	TransitionFull.transition("uid://be30br2a1sjrk")
	queue_free()


func _on_respawn_pressed() -> void:
	get_tree().paused = false
	var file = FileAccess.open("user://save_game%d.dat" %Gamedata.savedgame, FileAccess.READ)
	if file:
		var Destination = file.get_line() 
		TransitionFull.transition(Destination)
	else:
		TransitionFull.transition("uid://baws2r3t8klad")
	queue_free()
	Gamedata.Health = 9
