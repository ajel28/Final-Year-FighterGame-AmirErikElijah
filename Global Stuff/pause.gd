extends Node2D


@export var PauseScreen: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_link_button_pressed():
	var ps = PauseScreen.instantiate()
	add_child(ps)
