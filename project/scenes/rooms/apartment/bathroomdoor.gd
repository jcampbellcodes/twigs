extends "res://assets/scripts/entities/item.gd"

func _talk():
	dialog_static.show_dialog("T-The hand icon’s there if you need to poop.", "liam", 10.0)

func _look():
	dialog_static.show_dialog("That’s the bathroom.", "liam", 20.0)

func _use():
	dialog_static.show_dialog("(transitions to bathroom)", "liam", 7.0)
