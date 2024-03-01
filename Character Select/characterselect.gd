extends Node2D

@export var jinP1select: PackedScene
@export var jinP2select: PackedScene

@export var DjinP1select: PackedScene
@export var DjinP2select: PackedScene

@export var DeadpoolP1select: PackedScene
@export var DeadpoolP2select: PackedScene

@export var JohnWickP1select: PackedScene
@export var JohnWickP2select: PackedScene

@export var RyuP1Select: PackedScene
@export var RyuP2Select: PackedScene

@export var DoomP1Select: PackedScene
@export var DoomP2Select: PackedScene

func _on_jin_button_pressed():
		if(Global.player==1):
			var jin1 = jinP1select.instantiate()
			get_tree().root.get_node("characterselect").add_child(jin1)
			Global.player+=1
		elif(Global.player==2):
			var jin2 = jinP2select.instantiate()
			get_tree().root.get_node("characterselect").add_child(jin2)
			Global.player+=1

func _on_deadpool_button_pressed():
	if(Global.player==1):
		var deadpoolp1 = DeadpoolP1select.instantiate()
		get_tree().root.get_node("characterselect").add_child(deadpoolp1)
		Global.player+=1
	elif(Global.player==2):
		var deadpoolp2 = DeadpoolP2select.instantiate()
		get_tree().root.get_node("characterselect").add_child(deadpoolp2)
		Global.player+=1


func _on_ryu_button_pressed():
	if(Global.player==1):
		var ryup1 = RyuP1Select.instantiate()
		get_tree().root.get_node("characterselect").add_child(ryup1)
		Global.player+=1
	elif(Global.player==2):
		var ryup2 = RyuP2Select.instantiate()
		get_tree().root.get_node("characterselect").add_child(ryup2)
		Global.player+=1


func _on_doom_button_pressed():
	if(Global.player==1):
		var doomp1 = DoomP1Select.instantiate()
		get_tree().root.get_node("characterselect").add_child(doomp1)
		Global.player+=1
	elif(Global.player==2):
		var doomp2 = DoomP2Select.instantiate()
		get_tree().root.get_node("characterselect").add_child(doomp2)
		Global.player+=1


func _on_terminator_button_pressed():
	pass # Replace with function body.


func _on_w_soldier_button_pressed():
	pass # Replace with function body.


func _on_d_jin_button_pressed():
	if(Global.player==1):
		var djin1 = DjinP1select.instantiate()
		get_tree().root.get_node("characterselect").add_child(djin1)
		Global.player+=1
	elif(Global.player==2):
		var djin2 = DjinP2select.instantiate()
		get_tree().root.get_node("characterselect").add_child(djin2)
		Global.player+=1


func _on_john_wick_button_pressed():
	if(Global.player==1):
		var johnWickp1 = JohnWickP1select.instantiate()
		get_tree().root.get_node("characterselect").add_child(johnWickp1)
		Global.player+=1
	elif(Global.player==2):
		var johnWickp2 = JohnWickP2select.instantiate()
		get_tree().root.get_node("characterselect").add_child(johnWickp2)
		Global.player+=1

func _on_raiden_button_pressed():
	pass # Replace with function body.


func _on_rocky_button_pressed():
	pass # Replace with function body.


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Menu/intro_screen.tscn")
	Global.player = 1

func _on_next_button_pressed():
	pass # Replace with function body.
