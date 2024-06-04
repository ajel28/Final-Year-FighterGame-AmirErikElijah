extends Area2D

class_name TermFireballPlayer2

@export var speed = 1500
	
func _physics_process(delta):
	global_position.x += -speed * delta
		
func _on_area_entered(area):
	if !(area is TermFireballPlayer2) and !(area is BulletCatcher):
		Global.healthp1-=0.5
		print(Global.healthp1)
		self.queue_free()
	elif (area is BulletCatcher):
		self.queue_free()
