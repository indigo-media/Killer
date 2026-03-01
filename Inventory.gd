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
	load_inventory()


func load_inventory():
	if not FileAccess.file_exists("res://KillerSaveData.txt"):
		return
	var save_file = FileAccess.open("res://KillerSaveData.txt", FileAccess.READ)
	var json_string = save_file.get_line()
	var json = JSON.new()
	json.parse(json_string)
	var node_data = json.data
	#inside node data
	#node_data = {
	# "item_name" : count
	#}67
	#access item  using node_data["item_name"] gives you counts
	Gamedata.MasterKey = int(node_data["MasterKey"])
	Gamedata.hasCandle = int(node_data["Candle"])
	Gamedata.hasBomb = int(node_data["Bomb"])
		
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

			
