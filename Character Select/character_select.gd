extends Node2D

@export var jinP1select: PackedScene
@export var jinP2select: PackedScene
func _on_jin_button_pressed():
	if(Global.player%2==1):
		var jin1 = jinP1select.instantiate()
		get_tree().root.get_node("CharacterSelect").add_child(jin1)
		Global.player+=1
	elif(Global.player%2==0):
		var jin2 = jinP2select.instantiate()
		get_tree().root.get_node("CharacterSelect").add_child(jin2)
		Global.player+=1

func _on_deadpool_button_pressed():
	pass # Replace with function body.


func _on_ryu_button_pressed():
	pass # Replace with function body.


func _on_doom_button_pressed():
	pass # Replace with function body.


func _on_terminator_button_pressed():
	pass # Replace with function body.


func _on_w_soldier_button_pressed():
	pass # Replace with function body.


func _on_d_jin_button_pressed():
	pass # Replace with function body.


func _on_john_wick_button_pressed():
	pass # Replace with function body.

func _on_raiden_button_pressed():
	pass # Replace with function body.


func _on_rocky_button_pressed():
	pass # Replace with function body.
