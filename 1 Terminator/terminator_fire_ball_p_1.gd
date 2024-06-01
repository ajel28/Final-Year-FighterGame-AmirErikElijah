extends Area2D

class_name TermFireballPlayer1

@export var speed = 1500
	
func _physics_process(delta):
	global_position.x += speed * delta
		
func _on_area_entered(area):
	if !(area is TermFireballPlayer1) and !(area is TerminatorPlayer1):
		Global.healthp2-=0.5
		print(Global.healthp2)
		self.queue_free()
