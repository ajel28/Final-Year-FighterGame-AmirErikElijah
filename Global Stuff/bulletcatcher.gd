extends Area2D

class_name BulletCatcher

func _on_area_entered(area):
	area.queue_free()
