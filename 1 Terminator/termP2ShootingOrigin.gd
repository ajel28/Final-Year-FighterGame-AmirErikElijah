extends Node2D

class_name TerminatorPlayer2

@export var termp2_scene: PackedScene


func _input(_event):
	if Input.is_action_just_pressed("ui_U"):
		var termp2 = termp2_scene.instantiate()
		add_child(termp2)
