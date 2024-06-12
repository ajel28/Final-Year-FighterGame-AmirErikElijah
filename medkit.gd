extends AnimatedSprite2D
@onready var animationsMed = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	animationsMed.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
