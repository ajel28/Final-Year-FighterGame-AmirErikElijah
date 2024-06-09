extends Node2D

class_name DevilJin1

@export var djinp1_scene: PackedScene


func _input(_event):
	if Input.is_action_just_pressed("ui_Q") and $Timer.time_left==0:
		var djin = djinp1_scene.instantiate()
		add_child(djin)
		$Timer.start()


func _on_timer_timeout():
	$Timer.stop()
