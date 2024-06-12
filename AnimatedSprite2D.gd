extends AnimatedSprite2D
@onready var animationsMed = $"."
var speed = 600
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _physics_process(delta):
	global_position.y += speed * delta
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	animationsMed.play("default")
	
