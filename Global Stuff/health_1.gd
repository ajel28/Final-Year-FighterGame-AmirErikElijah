extends Node2D
@onready var animationsH1 = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func takeHealth1():
	if Global.healthp1 < 101:
		animationsH1.play("dam1")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
