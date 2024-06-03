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
	if !(area is DoomAttackPlayer2):
		Global.healthp1-=0.5
		print(Global.healthp1)
		self.queue_free()

