extends "res://assets/scripts/inventory_item.gd"

func _talk():
	dialog_static.show_dialog("Well I'm holding it...; Not sure what to do with it.", "liam", 10.0)

func _look():
	dialog_static.show_dialog("What am I just gonna look at it?", "liam", 20.0)
