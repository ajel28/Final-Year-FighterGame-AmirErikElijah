extends Area2D

class_name RaidenAttP1

@export var speed = 1500
@onready var animRaid1 = $AnimatedSprite2D
	
func _ready():
	animRaid1.play("buzz")
	
func _physics_process(delta):
	global_position.x += speed * delta
		
func _on_area_entered(area):
	if !(area is RaidenAttP1):
		Global.hitsInRowP2 = 0
		Global.hitsInRowP1+=1;
		Global.healthp2-=0.5
		print(Global.healthp2)
		if Global.hitsInRowP1 == 3:
			$Triple.play()
		elif Global.hitsInRowP1 == 5:
			$Fatality.play()
		self.queue_free()
