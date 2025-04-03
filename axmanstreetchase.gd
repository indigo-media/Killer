extends Area2D

var SPEED: float = 325


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

@export var playerposition: CharacterBody2D 

@export var activated := false 

func _process(delta: float) -> void:
	var velocity: Vector2
	
	var attackstreet := playerposition.position - self.position 
	
	var movementAxmanStreet := absf(attackstreet.x) > absf(attackstreet.y)
	if $ChaseTimer.is_stopped():
		if movementAxmanStreet:
			# Player is left or right
			if attackstreet.x < 0:
				velocity = Vector2.LEFT * SPEED
				$AnimatedSprite2D.play("Left")
			else:
				velocity = Vector2.RIGHT * SPEED
				$AnimatedSprite2D.play("Right")
		else: 
			if attackstreet.y < 0:
				velocity = Vector2.UP * SPEED
				$AnimatedSprite2D.play("Up")
			else:
				velocity = Vector2.DOWN * SPEED
				$AnimatedSprite2D.play("Down")
		
		# Player is up or down

	if $StraightTimer.is_stopped():
		var directionAxmanStreet := attackstreet.normalized() * SPEED
		velocity = directionAxmanStreet
		if directionAxmanStreet.y < 0:
			$AnimatedSprite2D.play("Up")
		if directionAxmanStreet.y > 0:
			$AnimatedSprite2D.play("Down")
		if directionAxmanStreet.x < 0:
			$AnimatedSprite2D.play("Left")
		if directionAxmanStreet.x > 0:
			$AnimatedSprite2D.play("Right")
		
			
		
	if activated == true:
		position += velocity*delta
		
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Guy":
		if activated == true:
			var clone = preload("res://Youdied.tscn").instantiate()
			get_tree().root.add_child(clone)
			get_tree().paused = true


func _on_straight_timer_timeout() -> void:
	$ChaseTimer.start()


func _on_chase_timer_timeout() -> void:
	$StraightTimer.start()
	
