extends Area2D

@onready var parent = $Jin

func _on_area_entered(area):
	Global.healthp2-=5
	print(Global.healthp2)
