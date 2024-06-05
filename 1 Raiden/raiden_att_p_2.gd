extends Area2D

class_name RaidenAttP2

@export var speed = 1500
@onready var animRaid2 = $AnimatedSprite2D
func _ready():
	animRaid2.play("buzz2")
func _physics_process(delta):
	global_position.x += -speed * delta
		
func _on_area_entered(area):
	if (area is RaidenAttP1) or (area is TermFireballPlayer1) or (area is TermFireballPlayer2) or (area is DoomAttackPlayer1) or (area is DoomAttackPlayer2):
		self.queue_free()
	elif !(area is RaidenAttP2):
		Global.healthp1-=2
		print(Global.healthp1)
		self.queue_free()
