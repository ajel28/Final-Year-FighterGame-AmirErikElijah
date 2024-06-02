extends Node2D

class_name DoomPlayer2

@export var doomp2_scene: PackedScene


func _input(_event):
	if Input.is_action_just_pressed("ui_U"):
		var doomp2 = doomp2_scene.instantiate()
		doomp2.global_position = get_parent().global_position - Vector2(0, 20)
		add_child(doomp2)
