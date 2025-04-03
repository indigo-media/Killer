extends CanvasLayer

func transition (whereto): 
	$AnimationPlayer.play("Transition")
	get_tree().paused=true
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(whereto)
	$AnimationPlayer.play ("Transition_In")
	get_tree().paused=false
