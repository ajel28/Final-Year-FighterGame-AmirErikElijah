extends Node2D

class_name RaidenPlayer1

@export var raidp1_scene: PackedScene


func _input(_event):
	if Input.is_action_just_pressed("ui_Q") and $Timer.time_left==0:
		var raidp1 = raidp1_scene.instantiate()
		add_child(raidp1)
		$Timer.start()


func _on_timer_timeout():
	$Timer.stop()
