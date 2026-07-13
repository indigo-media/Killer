extends Area2D

@export var fanciestName: String

var current_scene: String
func _ready() -> void:
	current_scene = get_tree().current_scene.scene_file_path

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		var file = FileAccess.open("user://save_game%d.dat" %Gamedata.savedgame, FileAccess.WRITE)
		file.store_line(current_scene)
		file.store_line(Gamedata.gamename)
		file.store_line (Gamedata.charactertype)
		file.store_line(fanciestName)

		var inventory := saveGame()
		file.store_line(inventory)

		$AnimationPlayer.play ("SavedGame")

func saveGame() -> String:
	var gamedata = Gamedata.save()
	return JSON.stringify(gamedata)
