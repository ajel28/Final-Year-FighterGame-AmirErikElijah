extends Node2D


func _on_character_select_pressed():
	get_tree().change_scene_to_file("res://Character Select/characterselect.tscn")

func _on_intro_back_pressed():
	get_tree().change_scene_to_file("res://Menu/start_menu.tscn")