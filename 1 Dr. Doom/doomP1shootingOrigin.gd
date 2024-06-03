extends Node2D

class_name DoomPlayer1

@export var doomp1_scene: PackedScene


func _input(_event):
	if Input.is_action_just_pressed("ui_Q"):
		var doomp1 = doomp1_scene.instantiate()
		add_child(doomp1)
