extends Node2D


@export var abandonRuins: PackedScene

@export var subconscious: PackedScene

@export var ninshitani: PackedScene

@export var takachiho: PackedScene

@export var depths: PackedScene

@export var theDojo: PackedScene

@export var yakushima: PackedScene

@export var frostbite: PackedScene

func _on_abandoned_button_pressed():
	pass # Replace with function body.


func _on_frost_button_pressed():
	pass # Replace with function body.


func _on_into_button_pressed():
	pass # Replace with function body.


func _on_nin_button_pressed():
	pass # Replace with function body.


func _on_taka_button_pressed():
	pass # Replace with function body.


func _on_depth_button_pressed():
	pass # Replace with function body.


func _on_dojo_button_pressed():
	pass # Replace with function body.


func _on_yaku_button_pressed():
	pass # Replace with function body.


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Character Select/characterselect.tscn")
	Global.map = 0


func _on_next_button_pressed():
	pass # Replace with function body.
