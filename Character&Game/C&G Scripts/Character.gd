extends CharacterBody2D
class_name Player

const SPEED = 330.0

var islocked = false 

var ishiding = false

var directionX: float

var isRight = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(_delta: float) -> void:
	# Add the gravity.


	# Handle jump.

 
	if islocked == false:

		directionX = Input.get_axis("Left", "Right")
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
			isRight = false
		if directionX > 0:
			$AnimatedSprite2D.play("Right")
			isRight = true
		if directionX == 0 and directionY == 0:
			$AnimatedSprite2D.stop() 

func hideincrate():
	$"hiding cooldown".start()
	visible = false
	ishiding = true
	islocked = true
	Gamedata.inAnim = true
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact"):
		if ishiding == true and $"hiding cooldown".is_stopped():
			visible = true 
			ishiding = false
			islocked = false
			Gamedata.inAnim = false
	if event.is_action_pressed("Menu"):
		var exit = preload("uid://wl3n8edne2xe").instantiate()
		get_tree().root.add_child(exit)
	if event.is_action_pressed("Hammer"):
		if Gamedata.hasHammer == true:
			$Hammer.visible = true
			if isRight == true:
				$Hammer.flip_h = true
				$Hammer.position.x = 41
			else:
				$Hammer.flip_h = false
				$Hammer.position.x = -41
			$Hammer.play("default")
			await $Hammer.animation_finished 
			$Hammer.visible = false
			var overlaps: Array[Area2D] = $Hammer/HammerZone.get_overlapping_areas()
			for overlap in overlaps:
				if overlap.is_in_group("hammerable") and Gamedata.inAnim == false:
					overlap.hammerHit() 
		else:
			return
			
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
	elif Damage > 0:
		$AnimationPlayer.play("Heal")
	if  Gamedata.Health == 1:
		$CanvasLayer/Health.play("Almost Death!")
		
