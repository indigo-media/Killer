extends Control

var deleteMode = false

func _ready() -> void:
	onLevel.gameState = -1
	$VBoxContainer/Play.grab_focus()
	for i in range(1, 5):
		var file = FileAccess.open("user://save_game%d.dat" %i, FileAccess.READ)
		if file:
			var Destination = file.get_line()
			var Gamename = file.get_line()
			var charactertype = file.get_line() 
			var FNAME = file.get_line()
			var saveButton:Button = get_node("Grid Container/Save%d" % i)
			saveButton.text = "%s: %s"% [Gamename, FNAME]
			saveButton.set_meta("dest", Destination)
			saveButton.set_meta ("Gamename", Gamename)
			saveButton.set_meta ("charactertype", charactertype)
			var inventory_string: String = file.get_line()
			if inventory_string.is_empty():
				continue
			var inventory: Dictionary = JSON.parse_string(inventory_string)
			saveButton.set_meta ("inventory", inventory)

func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_play_pressed() -> void:
	$"Grid Container/Save1".grab_focus()
	$VBoxContainer/Play.visible = false
	$VBoxContainer/Exit.visible = false
	$Label.visible = false
	$"Grid Container".visible = true
	$"Grid Container/Save1".visible = true
	$"Grid Container/Save2".visible = true
	$"Grid Container/Save3".visible = true
	$"Grid Container/Save4".visible = true
	$DeleteSave.visible = true
		
func _on_save_pressed(savei: int) -> void:
	var saveButton = get_node("Grid Container/Save" + str(savei))
	if deleteMode == true:
		DirAccess.remove_absolute("user://save_game%d.dat" %savei) 
		saveButton.text = "Save %d [Empty]" %savei
		deleteMode = false
		$Label2.visible = false
	else:
		var hasNameData = saveButton.text.find(":")
		Gamedata.savedgame = savei
		if hasNameData < 0:
			#create a character
			TransitionFull.transition("uid://do0yxivlnp1bu")
		else:
			Gamedata.gamename = (saveButton.get_meta("Gamename"))
			Gamedata.charactertype = (saveButton.get_meta("charactertype"))
			var node_data: Dictionary = saveButton.get_meta("inventory", {})
			Gamedata.MasterKey = int(node_data["MasterKey"])
			Gamedata.hasCandle = int(node_data["Candle"])
			Gamedata.hasBomb = int(node_data["Bomb"])
			
			TransitionFull.transition(saveButton.get_meta("dest"))
	
func _on_delete_save_pressed() -> void:
	$"Grid Container/Save1".grab_focus()
	$Label2.visible = true
	deleteMode = true
