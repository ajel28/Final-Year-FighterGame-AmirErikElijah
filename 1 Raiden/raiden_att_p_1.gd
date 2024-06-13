extends Area2D

class_name RaidenAttP1

@export var speed = 1500
@onready var animRaid1 = $AnimatedSprite2D
	
func _ready():
	animRaid1.play("buzz")
	
func _physics_process(delta):
	global_position.x += speed * delta
		
func _on_area_entered(area):
	if (area is RaidenAttP2) or (area is BulletCatcher) or (area is TermFireballPlayer1) or (area is TermFireballPlayer2) or (area is DoomAttackPlayer1) or (area is DoomAttackPlayer2) or (area is DJinAttack1) or (area is DJinAttack2):
		self.queue_free()
	elif (area is Med):
		area.queue_free()
	elif !(area is RaidenAttP1):
		Global.healthp2-=5
		print(Global.healthp2)
		self.queue_free()
