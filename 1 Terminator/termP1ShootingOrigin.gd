extends Node2D

@export var termp1_scene: PackedScene


func _input(_event):
	if Input.is_action_just_pressed("ui_Q"):
		var termp1 = termp1_scene.instantiate()
		termp1.global_position = get_parent().global_position - Vector2(0, 20)
		add_child(termp1)
