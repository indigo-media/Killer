extends Area2D
@export var TableSprite : AnimatedSprite2D
@export var mK : AnimatedSprite2D
@export var areaGone : CollisionShape2D

func _ready() -> void:
	pass # Replace with function body.
	
func hammerHit(): 
	if TableSprite.frame == 1:
		return
	TableSprite.frame = 1
	mK.visible = true
	areaGone.disabled = true
