extends Node2D

func _ready() -> void:
	set_process(false)
	$Path2D/PathFollow2D/Vampire.visible = false
	if Gamedata.enteredHR1 == false:
		Gamedata.enteredHR1 = true
		$StaticBody2D/Door.locked = true
		$StaticBody2D/Door2.locked = true
		$Guy.islocked = true 
		Dialogic.start(preload("res://HidingRoom1Encounter.dtl"))
		await Dialogic.timeline_ended
		Heartbeat.start()
		$Guy.islocked = false 
		$Timer.start()
		await $Timer.timeout
		set_process(true)

func _process(delta: float) -> void:
		$Path2D/PathFollow2D/Vampire.visible = true
		$Path2D/PathFollow2D/Vampire.setactive()
		$Path2D/PathFollow2D.progress_ratio+=0.3333 * delta
		$Path2D/PathFollow2D/Vampire/AnimatedSprite2D.play("Right")
		if $Path2D/PathFollow2D.progress_ratio == 1:
			$Path2D/PathFollow2D/Vampire.visible = false
			$StaticBody2D/Door.locked = false
			$StaticBody2D/Door2.locked = false
			Heartbeat.end()
