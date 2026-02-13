extends Node2D
var Couch = false
var Chair = false
var Book = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$FfHall.play("default")



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		if Couch == false:
			$FfHall.play("Couch In")
			Couch = true
		else:
			$FfHall.play("Couch Out")
			Couch = false
			await $FfHall.animation_finished
			$FfHall.play("default")


func _on_chair_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		if Chair == false:
			$FfHall.play("Chair Out")
			Chair = true
			Dialogic.start(preload("res://Yougottakey.dtl"))
		else:
			$FfHall.play("Chair In")
			Chair = false
			await $FfHall.animation_finished
			$FfHall.play("default")


func _on_book_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		if Book == false:
			$FfHall.play("BBOK")
			Book = true
			Dialogic.start(preload("res://laBook1.dtl"))
		else:
			$FfHall.play("KKOB")
			Book = false
			await $FfHall.animation_finished
			$FfHall.play("default")
