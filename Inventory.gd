extends CanvasLayer

@onready var tabs : TabContainer = $"MarginContainer/TabContainer"

		
func _ready() -> void:
	self.visible = false
	print(get_children())
	Gamedata.bombCountChange.connect(
		func(value):
			var bomb_label = $MarginContainer/TabContainer/Inventory/BombCounter
			if value == 0:
				print("something")
				$MarginContainer/TabContainer/Inventory/Bomb.modulate.a = 0.3
			else:
				$MarginContainer/TabContainer/Inventory/Bomb.modulate.a = 1
			bomb_label.text = str(value)
	)
	Gamedata.candleCountChange.connect(
		func(value):
			var candle_label = $MarginContainer/TabContainer/Inventory/CandleCounter
			if value == 0:
				print("something")
				$MarginContainer/TabContainer/Inventory/Candle.modulate.a = 0.3
			else:
				$MarginContainer/TabContainer/Inventory/Candle.modulate.a = 1
			candle_label.text = str(value)
	)
	
		
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Next"):
		if $Timer.is_stopped():
			tabs.select_next_available()
			$Timer.start()
	
	if event.is_action_pressed("Before"):
		if $Timer.is_stopped():
			tabs.select_previous_available()
			$Timer.start()
	
	if event.is_action_pressed("Inventory"):
		if onLevel.gameState == 0:
			visible = not visible
			Gamedata.player.islocked = visible

			
