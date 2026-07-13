extends Node

var  inventoryOn: bool = false
@onready var inventoryControl = load("res://Inventory.tscn")
var	inventory

func _ready() -> void:
	
	inventory = inventoryControl.instantiate()
	inventory.visible = false
	add_child(inventory)


		 
	
