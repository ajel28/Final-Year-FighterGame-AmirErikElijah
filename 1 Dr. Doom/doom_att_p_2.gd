extends Area2D
class_name DoomAttackPlayer2
@onready var animDoom2 = $AnimatedSprite2D
@export var speed = 1500

# Called when the node enters the scene tree for the first time.
func _ready():
	animDoom2.play("gb2")
	
func _physics_process(delta):
	global_position.x += -speed * delta
		
func _on_area_entered(area):
	if (area is DJinAttack1) or (area is DJinAttack2) or (area is RaidenAttP2) or (area is BulletCatcher) or (area is TermFireballPlayer1) or (area is TermFireballPlayer2) or (area is DoomAttackPlayer1) or (area is RaidenAttP1):
		self.queue_free()
	elif (area is Med):
		area.queue_free()
	elif !(area is DoomAttackPlayer2):
		Global.healthp1-=4
		print(Global.healthp2)
		self.queue_free()

