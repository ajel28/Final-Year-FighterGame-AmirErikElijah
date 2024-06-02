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
		Global.healthp2-=0.5
		print(Global.healthp2)
		self.queue_free()
