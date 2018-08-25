extends "res://assets/scripts/entities/item.gd"

func _talk():
	dialog_static.show_dialog("Megs Media Marcher", "liam", 10.0)

func _look():
	dialog_static.show_dialog("Megs meme machine", "liam", 10.0)

func _use():
	dialog_static.show_dialog("We're going to do a scene change here!", "liam", 20.0)
