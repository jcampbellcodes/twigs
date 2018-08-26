extends "res://assets/scripts/entities/item.gd"

func _talk():
	dialog_static.show_dialog("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "liam", 10.0)

func _look():
	dialog_static.show_dialog("Well would you look at that! A fridge!; Golly!", "liam", 20.0)

func _use():
	dialog_static.show_dialog("I can't use that.; Fuck u", "liam", 7.0)
