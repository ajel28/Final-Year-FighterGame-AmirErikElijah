extends Node2D


@export var abandonRuins: PackedScene
var abandonbool = false

@export var subconscious: PackedScene
var subc = false

@export var ninshitani: PackedScene
var ninsh = false

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
		fros = true


func _on_into_button_pressed():
	if(Global.map==0):
		var sub = subconscious.instantiate()
		get_tree().root.get_node("MapSelect").add_child(sub)
		Global.map+=1
		subc = true


func _on_nin_button_pressed():
	if(Global.map==0):
		var nin = ninshitani.instantiate()
		get_tree().root.get_node("MapSelect").add_child(nin)
		Global.map+=1
		ninsh = true


func _on_taka_button_pressed():
	if(Global.map==0):
		var taka = takachiho.instantiate()
		get_tree().root.get_node("MapSelect").add_child(taka)
		Global.map+=1
		tak = true


func _on_depth_button_pressed():
	if(Global.map==0):
		var depth = depths.instantiate()
		get_tree().root.get_node("MapSelect").add_child(depth)
		Global.map+=1
		dep = true


func _on_dojo_button_pressed():
	if(Global.map==0):
		var dojo = theDojo.instantiate()
		get_tree().root.get_node("MapSelect").add_child(dojo)
		Global.map+=1
		doj = true


func _on_yaku_button_pressed():
	if(Global.map==0):
		var yaku = yakushima.instantiate()
		get_tree().root.get_node("MapSelect").add_child(yaku)
		Global.map+=1
		yak = true


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Character Select/characterselect.tscn")
	Global.map = 0
	Global.player = 1;


func _on_next_button_pressed():
	if(Global.map==1):
		if(abandonbool==true):
			get_tree().change_scene_to_file("res://Maps/ruins_map.tscn")
		elif(subc==true):
			get_tree().change_scene_to_file("res://Maps/subconscious_map.tscn")
		elif(ninsh==true):
			get_tree().change_scene_to_file("res://Maps/ninshitani_map.tscn")
		elif(tak==true):
			get_tree().change_scene_to_file("res://Maps/taka_map.tscn")
		elif(dep==true):
			get_tree().change_scene_to_file("res://Maps/depths_map.tscn")
		elif(doj==true):
			get_tree().change_scene_to_file("res://Maps/dojo_background.tscn")
		elif(yak==true):
			get_tree().change_scene_to_file("res://Maps/yaku_map.tscn")
		elif(fros==true):
			get_tree().change_scene_to_file("res://Maps/frosbite_map.tscn")
		
