extends "res://assets/scripts/entities/item.gd"

func _talk():
	dialog_static.show_dialog("Courtesy of your own local cheap western trinket joint!", "liam", 10.0)

func _look():
	dialog_static.show_dialog("A Navajo knit rug my mom got us on moving day.", "liam", 20.0)

func _use():
	dialog_static.show_dialog("Huh? Why?", "liam", 7.0)
