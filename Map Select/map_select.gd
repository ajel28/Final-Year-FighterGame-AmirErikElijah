extends Node2D


@export var abandonRuins: PackedScene
var abandonbool = false

@export var subconscious: PackedScene
var sub = false

@export var ninshitani: PackedScene
var nin = false

@export var takachiho: PackedScene
var tak = false

@export var depths: PackedScene
var dep = false

@export var theDojo: PackedScene
var doj = false

@export var yakushima: PackedScene
var yak = false

@export var frostbite: PackedScene
var fros = false

func _on_abandoned_button_pressed():
	if(Global.map==0):
		var abandon = abandonRuins.instantiate()
		get_tree().root.get_node("MapSelect").add_child(abandon)
		Global.map+=1
		abandonbool = true


func _on_frost_button_pressed():
	if(Global.map==0):
		var frost = frostbite.instantiate()
		get_tree().root.get_node("MapSelect").add_child(frost)
		Global.map+=1


func _on_into_button_pressed():
	if(Global.map==0):
		var sub = subconscious.instantiate()
		get_tree().root.get_node("MapSelect").add_child(sub)
		Global.map+=1


func _on_nin_button_pressed():
	if(Global.map==0):
		var nin = ninshitani.instantiate()
		get_tree().root.get_node("MapSelect").add_child(nin)
		Global.map+=1


func _on_taka_button_pressed():
	if(Global.map==0):
		var taka = takachiho.instantiate()
		get_tree().root.get_node("MapSelect").add_child(taka)
		Global.map+=1


func _on_depth_button_pressed():
	if(Global.map==0):
		var depth = depths.instantiate()
		get_tree().root.get_node("MapSelect").add_child(depth)
		Global.map+=1


func _on_dojo_button_pressed():
	if(Global.map==0):
		var dojo = theDojo.instantiate()
		get_tree().root.get_node("MapSelect").add_child(dojo)
		Global.map+=1


func _on_yaku_button_pressed():
	if(Global.map==0):
		var yaku = yakushima.instantiate()
		get_tree().root.get_node("MapSelect").add_child(yaku)
		Global.map+=1


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Character Select/characterselect.tscn")
	Global.map = 0


func _on_next_button_pressed():
	pass
