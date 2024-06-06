extends Node2D

class_name DoomPlayer2

@export var doomp2_scene: PackedScene


func _input(_event):
	if Input.is_action_just_pressed("ui_U") and $Timer.time_left==0:
		var doomp2 = doomp2_scene.instantiate()
		add_child(doomp2)
		$Timer.start()


func _on_timer_timeout():
	$Timer.stop()
