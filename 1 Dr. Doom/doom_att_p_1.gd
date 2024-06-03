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
	if !(area is DoomAttackPlayer1):
		Global.healthp2-=0.5
		print(Global.healthp2)
		self.queue_free()
