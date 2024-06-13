extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_link_button_pressed():
	get_tree().change_scene_to_file("res://Menu/start_menu.tscn")
	Global.healthp1=100
	Global.healthp2=100
	Global.player=1
	Global.map=0
