extends Node2D

<<<<<<< HEAD
@export var jinP1select: PackedScene
@export var jinP2select: PackedScene


func _on_jin_button_pressed():
	while(Global.player<=2):
		if(Global.player==1):
			var jin1 = jinP1select.instantiate()
			get_tree().root.get_node("CharacterSelect").add_child(jin1)
			Global.player+=1
		elif(Global.player2==2):
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


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Menu/start_menu.tscn")


func _on_reset_button_pressed():
	Global.player=1
	return true
=======

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_jin_button_pressed():
	pass # Replace with function body.


func _on_deadpool_button_pressed():
	pass # Replace with function body.
>>>>>>> parent of 7424bc8 (continued to work on character selection)
