extends "res://assets/scripts/item.gd"

func _talk():
	get_node("/root/apartment/dialog").show_dialog("bottom", "What's in the fridge eh", "liam", 10.0)

func _look():
	get_node("/root/apartment/dialog").show_dialog("bottom", "Well would you look at that! A fridge!; Golly!", "liam", 20.0)

func _use():
	get_node("/root/apartment/dialog").show_dialog("bottom", "I can't use that.; Fuck u", "liam", 7.0)
