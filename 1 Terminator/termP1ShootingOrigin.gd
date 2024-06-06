extends Node2D

class_name TerminatorPlayer1

@export var termp1_scene: PackedScene


func _input(_event):
	if Input.is_action_just_pressed("ui_Q") and $Timer.time_left==0:
		var termp1 = termp1_scene.instantiate()
		add_child(termp1)
		$Timer.start()


func _on_timer_timeout():
	$Timer.stop()
