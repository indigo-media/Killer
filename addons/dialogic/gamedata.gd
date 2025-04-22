extends Node

var enteredHR1 = false

var savedgame = 1

var gamename = ""

var charactertype = ("res://Brother.tres")

var Health = 9
signal healthChanged(Damage:int)
func _takeDamage(Damage:int):
	Health -= Damage
	healthChanged.emit(-Damage)
