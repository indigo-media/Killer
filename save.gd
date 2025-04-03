extends Area2D
@export_file("*.tscn") var Destination: String 

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		var file = FileAccess.open("user://save_game%d.dat" %Gamedata.savedgame, FileAccess.WRITE)
		file.store_line(Destination)
		file.store_line(Gamedata.gamename)
		file.store_line (Gamedata.charactertype)
		$AnimationPlayer.play ("SavedGame")
	
