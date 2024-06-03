extends Area2D

class_name RaidenAttP2

@export var speed = 1500
@onready var animRaid2 = $AnimatedSprite2D
func _ready():
	animRaid2.play("buzz2")
func _physics_process(delta):
	global_position.x += -speed * delta
		
func _on_area_entered(area):
	if !(area is RaidenAttP2):
		Global.healthp1-=0.5
		print(Global.healthp1)
		self.queue_free()
