extends "res://assets/scripts/item.gd"

func _talk():
	get_node("/root/apartment/dialog").show_dialog("bottom", "What the fuck", "liam", 10.0)

func _look():
	get_node("/root/apartment/dialog").show_dialog("middle", "Well would you look at that weed!; Golly!", "liam", 20.0)

func _use():
	get_node("/root/apartment/dialog").show_dialog("top", "I can't use that.; Fuck u", "liam", 5.0)
