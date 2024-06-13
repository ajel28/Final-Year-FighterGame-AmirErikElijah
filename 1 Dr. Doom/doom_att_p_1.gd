extends Area2D
class_name DoomAttackPlayer1
@onready var animDoom1 = $AnimatedSprite2D
@export var speed = 1500

# Called when the node enters the scene tree for the first time.
func _ready():
	animDoom1.play("gb")
	
func _physics_process(delta):
	global_position.x += speed * delta
		
func _on_area_entered(area):
	if (area is DJinAttack1) or (area is DJinAttack2) or (area is RaidenAttP2) or (area is BulletCatcher) or (area is TermFireballPlayer1) or (area is TermFireballPlayer2) or (area is RaidenAttP1) or (area is DoomAttackPlayer2) or (area is Med):
		self.queue_free()
		Global.punchP1 = false
	elif !(area is DoomAttackPlayer1):
		Global.healthp2-=4
		print(Global.healthp2)
		self.queue_free()
