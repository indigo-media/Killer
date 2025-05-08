extends Node2D

var player: Player 
 
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		player = body
		$AnimatedSprite2D.play('default')

func _on_animated_sprite_2d_animation_finished() -> void:
	if $Area2D.overlaps_body(player):
		Gamedata._takeDamage(3)
		player.get_node("AnimationPlayer").play("Falling Floor")
		player.islocked = true
		$Timer.start()
		await player.get_node("AnimationPlayer").animation_finished
		player.islocked = false
		player.position -= Vector2(25,25)

func _on_timer_timeout() -> void:
	$AnimatedSprite2D.frame = 0
