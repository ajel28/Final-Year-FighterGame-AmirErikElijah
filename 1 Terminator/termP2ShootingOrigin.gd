extends Node2D

class_name TerminatorPlayer2

@export var termp2_scene: PackedScene


func _input(_event):
	if Input.is_action_just_pressed("ui_U") and $Timer.time_left==0:
		var termp2 = termp2_scene.instantiate()
		add_child(termp2)
		$Timer.start()


func _on_timer_timeout():
	$Timer.stop()
