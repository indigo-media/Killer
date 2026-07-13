extends Control

func _process(_delta: float) -> void:
	self.visible = true
	$Label.text = str(Gamedata.MasterKey)
