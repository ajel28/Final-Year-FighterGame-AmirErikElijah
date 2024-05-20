extends Area2D

func _on_area_entered(area):
	pass


func _on_jin_p_1_area_2d_area_entered(area):
	if get_parent().kick == true:
		Global.healthp2-=5
		print(Global.healthp2)
