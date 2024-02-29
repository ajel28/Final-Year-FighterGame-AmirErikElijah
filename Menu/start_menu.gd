extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_link_button_pressed():
	get_tree().change_scene_to_file("res://Character Select/characterselect.tscn")


func _on_controls_button_pressed():
	get_tree().change_scene_to_file("res://Controls/controls.tscn")


func _on_exit_button_pressed():
	get_tree().quit()
