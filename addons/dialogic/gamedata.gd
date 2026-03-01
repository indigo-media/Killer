extends Node

var enteredHR1 = false

var savedgame = 1

var gamename = ""

var charactertype = ("res://Brother.tres")

signal bombCountChange(count : int)
var hasBomb = 0:
	set(value):
		hasBomb = value
		bombCountChange.emit(hasBomb)

var blownUprockwall = false

var MasterKey = 0

var Health = 9

enum Levels{NoLevel, HLM, HSW, HFG, GCH, SMH, ACO, NWA, OVM}

var levelGenral: Levels = Levels.NoLevel

func getScaredBro():
	if levelGenral == Levels.NoLevel:
		return"res://Youdied.tscn"
	elif levelGenral == Levels.HLM:
		return"res://jumpscare.tscn"

var inLevel = false

var lightsOut = true

var player: Player

var keyData:Array = []

var bombPlanted = false

var bombPicked = false

var hasHammer = false

signal candleCountChange(count : int)
var hasCandle = 0:
	set(value):
		print(value)
		hasCandle = value
		candleCountChange.emit(hasCandle)

signal healthChanged(Damage:int)
func _takeDamage(Damage:int):
	Health -= Damage
	healthChanged.emit(-Damage)
	
func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	#hasBomb = 0
	#hasCandle = 0

func save() -> Dictionary:
	var saveDict = {
		"Bomb" : hasBomb,
		"Candle" : hasCandle,
		"Hammer" : hasHammer,
		"MasterKey" : MasterKey
		
	}
	return saveDict
