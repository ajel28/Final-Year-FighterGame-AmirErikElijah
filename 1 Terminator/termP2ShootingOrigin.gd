extends Node2D

class_name TerminatorPlayer2

@export var termp2_scene: PackedScene


func _input(_event):
	if Input.is_action_just_pressed("ui_U"):
		var termp2 = termp2_scene.instantiate()
		termp2.global_position = get_parent().global_position - Vector2(0,20)
		add_child(termp2)
