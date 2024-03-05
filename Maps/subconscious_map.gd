extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var playerone = Global.player1.instantiate()
	get_tree().root.get_node("SubconsciousMap").add_child(playerone)
	var playertwo = Global.player2.instantiate()
	get_tree().root.get_node("SubconsciousMap").add_child(playertwo)