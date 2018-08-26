extends "res://assets/scripts/entities/item.gd"

func _talk():
	dialog_static.show_dialog("That thing’s called a fridge, we humans use it to keep food from spoiling, yeaah.", "liam", 10.0)

func _look():
	dialog_static.show_dialog("Hungry?", "liam", 20.0)

func _use():
	dialog_static.show_dialog("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "liam", 7.0)
