extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused=true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_link_button_pressed():
	get_tree().change_scene_to_file("res://Menu/start_menu.tscn")
	Global.map=0
	Global.player=1
	Global.healthp1=100
	Global.healthp2=100
