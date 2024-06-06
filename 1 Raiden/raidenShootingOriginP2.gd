extends Node2D

class_name RaidenPlayer2

@export var raidp2_scene: PackedScene


func _input(_event):
	if Input.is_action_just_pressed("ui_U") and $Timer.time_left==0:
		var raidp2 = raidp2_scene.instantiate()
		add_child(raidp2)
		$Timer.start()


func _on_timer_timeout():
	$Timer.stop()
