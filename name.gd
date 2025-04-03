extends Control

func _ready() -> void:
	$LineEdit.grab_focus()

func _on_line_edit_text_submitted(new_text: String) -> void:
	Gamedata.gamename = new_text
	if $CheckButton.button_pressed:
		Gamedata.charactertype = ("res://Sister.tres")
	else:
		Gamedata.charactertype = ("res://Brother.tres")
	TransitionFull.transition("res://OpeningScene.tscn")

func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$Brother.texture = load("res://Sister.png")
		$CheckButton.text = "Sister"
	else:
		
		$Brother.texture = load("res://ActualPlayer.png")
		$CheckButton.text = "Brother"
