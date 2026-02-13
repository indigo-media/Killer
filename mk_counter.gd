extends Control

func _process(_delta: float) -> void:
	if Gamedata.inLevel == true:
		self.visible = true
		$Label.text = str(Gamedata.MasterKey)
	else: 
		return
