extends Node2D

class_name TerminatorPlayer1

@export var termp1_scene: PackedScene


func _input(_event):
	if Input.is_action_just_pressed("ui_Q"):
		var termp1 = termp1_scene.instantiate()
		add_child(termp1)
