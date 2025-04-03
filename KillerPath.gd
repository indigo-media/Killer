extends Path2D

@export var doortolock: Array 
func activate():
	for door in doortolock:
		door.islocked = true
	Heartbeat.start()
	await get_tree().create_timer(5).timeout
	set_process(true)
	
func _ready() -> void: 
	set_process(false)
		
func _process(delta: float) -> void:
		$PathFollow2D/Vampire.visible = true
		$PathFollow2D/Vampire.setactive()
		$PathFollow2D.progress_ratio+=0.3333 * delta
		$PathFollow2D/Vampire/AnimatedSprite2D.play("Right")
		if $PathFollow2D.progress_ratio == 1:
			$PathFollow2D/Vampire.visible = false
			for door in doortolock:
				door.islocked = false
			Heartbeat.end()


func _on_timer_timeout() -> void:
	if randi_range (1,10)== 2:
		activate()
