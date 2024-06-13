extends Area2D
class_name DJinAttack2

@export var speed = 1500
func _ready():
	pass


func _physics_process(delta):
	global_position.x += -speed * delta
		
func _on_area_entered(area):
	if (area is RaidenAttP1) or (area is BulletCatcher) or (area is TermFireballPlayer1) or (area is TermFireballPlayer2) or (area is DoomAttackPlayer1) or (area is DoomAttackPlayer2) or (area is DJinAttack1) or (area is RaidenAttP2):
		self.queue_free()
	elif (area is Med):
		area.queue_free()
	elif !(area is DJinAttack2):
		Global.healthp1-=3
		print(Global.healthp1)
		self.queue_free()
