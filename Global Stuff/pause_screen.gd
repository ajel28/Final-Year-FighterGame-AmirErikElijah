extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Menu/start_menu.tscn")


func _on_resume_pressed():
	get_tree().paused = false
	self.queue_free()


func _on_resume_mouse_entered():
	$Resume.play()


func _on_settings_mouse_entered():
	$Settings.play()


func _on_exit_mouse_entered():
	$Exit.play()
	Global.player=1
	Global.map=0
	Global.healthp1=100
	Global.healthp2=100
