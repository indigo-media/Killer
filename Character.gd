extends CharacterBody2D


const SPEED = 330.0

var footstep = false


var islocked = false 

var ishiding = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	# Add the gravity.


	# Handle jump.

 
	if islocked == false:

		var directionX := Input.get_axis("Left", "Right")
		if directionX != 0:
			velocity.x = directionX * SPEED
			if footstep == false:
				$footOnWood.play()
				footstep = true

		else:
			velocity.x = move_toward(velocity.x, 0, SPEED) 
			
			
		var directionY := Input.get_axis("Up", "Down")
		if directionY !=0 :
			velocity.y = directionY * SPEED
			if footstep == false:
				$footOnWood.play()
				footstep = true
			
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)

		move_and_slide()

		if directionY < 0:
			$AnimatedSprite2D.play("Up")
		if directionY > 0:
			$AnimatedSprite2D.play("Down")
		if directionX < 0:
			$AnimatedSprite2D.play("Left")
		if directionX > 0:
			$AnimatedSprite2D.play("Right")
		if directionX == 0 and directionY == 0:
			$AnimatedSprite2D.stop() 
			footstep = false
			$footOnWood.stop()

func hideincrate():
	visible = false
	ishiding = true
	islocked = true
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		if ishiding == true:
			visible = true
			ishiding = false
			islocked = false
			
func _ready() -> void:
	$AnimatedSprite2D.sprite_frames = load (Gamedata.charactertype)
