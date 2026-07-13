extends Control

var normal = 1
var hard = 2
var incredible = 3

func _ready() -> void:
	onLevel.gameState = -1
	$LineEdit.grab_focus()

func _on_line_edit_text_submitted(new_text: String) -> void:
	if $LineEdit.text.length() > 0 and $LineEdit.text.length() < 16:
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


func _on_play_pressed() -> void:
	_on_line_edit_text_submitted($LineEdit.text)
