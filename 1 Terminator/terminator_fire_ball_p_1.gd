extends Area2D

class_name TermFireballPlayer1

@export var speed = 1500
	
func _physics_process(delta):
	global_position.x += speed * delta
		
func _on_area_entered(area):
	if (area is DJinAttack1) or (area is DJinAttack2) or (area is RaidenAttP2) or (area is BulletCatcher) or (area is RaidenAttP1) or (area is TermFireballPlayer2) or (area is DoomAttackPlayer1) or (area is DoomAttackPlayer2):
		self.queue_free()
	elif !(area is TermFireballPlayer1):
		Global.healthp2-=2
		print(Global.healthp2)
		self.queue_free()
