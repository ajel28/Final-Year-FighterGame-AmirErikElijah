extends Node2D

class_name RaidenPlayer2

@export var raidp2_scene: PackedScene


func _input(_event):
	if Input.is_action_just_pressed("ui_U"):
		var raidp2 = raidp2_scene.instantiate()
		raidp2.global_position = get_parent().global_position - Vector2(0,20)
		add_child(raidp2)
