extends Node2D

class_name RaidenPlayer2

@export var raidp2_scene: PackedScene


func _input(_event):
	if Input.is_action_just_pressed("ui_U"):
		var raidp2 = raidp2_scene.instantiate()
		add_child(raidp2)
