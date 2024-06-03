extends Node2D
class_name H1

@onready var animationsH = $AnimationPlayer

# Called when the node enters the scene tree for the first time.


func takeHealth1():
		animationsH.play("damage")
		
# Called every frame. 'delta' is the elapsed time since the previous frame.

