extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().root.get_node("RuinsSelect").add_sibling(Global.player1)
