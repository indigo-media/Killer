extends CanvasLayer

func start ():
	$AnimationPlayer.play("Heartbeat")
	
func end ():
	$AnimationPlayer.stop()
