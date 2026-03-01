extends CharacterBody2D
class_name Player

const SPEED = 330.0

var islocked = false 

var ishiding = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(_delta: float) -> void:
	# Add the gravity.


	# Handle jump.

 
	if islocked == false:

		var directionX := Input.get_axis("Left", "Right")
		if directionX != 0:
			velocity.x = directionX * SPEED

		else:
			velocity.x = move_toward(velocity.x, 0, SPEED) 
			
			
		var directionY := Input.get_axis("Up", "Down")
		if directionY !=0 :
			velocity.y = directionY * SPEED
			
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
			
		$imWalkingere.playing = directionX != 0 or directionY !=0

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

func hideincrate():
	$"hiding cooldown".start()
	visible = false
	ishiding = true
	islocked = true
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		if ishiding == true and $"hiding cooldown".is_stopped():
			visible = true 
			ishiding = false
			islocked = false
	if event.is_action_pressed("Menu"):
		var clone = preload("res://Exit.tscn").instantiate()
		get_tree().root.add_child(clone)
			
func _ready() -> void:
	$AnimatedSprite2D.sprite_frames = load (Gamedata.charactertype)
	Gamedata.healthChanged.connect(_updateHealth)
	_updateHealth(0)
	Gamedata.player = self
func _updateHealth(Damage:int):
	$CanvasLayer/Health.frame = 9 - Gamedata.Health 
	if Gamedata.Health < 1:
		get_tree().paused = true
		get_tree().change_scene_to_file(Gamedata.getScaredBro())
	elif  Damage < 0:
		$Hurt.play()
		$AnimationPlayer.play("Hurt")
	if  Gamedata.Health == 1:
		$CanvasLayer/Health.play("Almost Death!")
		
