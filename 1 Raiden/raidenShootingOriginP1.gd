extends Node2D

class_name RaidenPlayer1

@export var raidp1_scene: PackedScene


func _input(_event):
	if Input.is_action_just_pressed("ui_Q"):
		var raidp1 = raidp1_scene.instantiate()
		add_child(raidp1)
