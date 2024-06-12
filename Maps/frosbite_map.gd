extends Node2D

@export var med = preload("res://Global Stuff/MedKit.tscn")
var rng = RandomNumberGenerator.new()


func _input(_event):
	rng.randomize()
	if rng.randi_range(0,74) == 1:
		var medkit = med.instantiate()
		medkit.position.x = randi_range(100, 1300)
		add_child(medkit)
# Called when the node enters the scene tree for the first time.
func _ready():
	var playerone = Global.player1.instantiate()
	get_tree().root.get_node("FrostbiteMap").add_child(playerone)
	var playertwo = Global.player2.instantiate()
	get_tree().root.get_node("FrostbiteMap").add_child(playertwo)
