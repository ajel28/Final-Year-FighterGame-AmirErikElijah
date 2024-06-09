extends Node2D

class_name DJinP2ShootOr

@export var djin2_scene: PackedScene


func _input(_event):
	if Input.is_action_just_pressed("ui_U") and $Timer.time_left==0:
		var djin2 = djin2_scene.instantiate()
		add_child(djin2)
		$Timer.start()


func _on_timer_timeout():
	$Timer.stop()
