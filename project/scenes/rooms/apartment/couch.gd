extends "res://assets/scripts/entities/item.gd"

func _talk():
	dialog_static.show_dialog("The fabric seams are all over the place and the cushions feel like a plank of wood.", "liam", 10.0)

func _look():
	dialog_static.show_dialog("We were lucky we found one of those without cat hair or spider eggs...; -or a dead cat.", "liam", 20.0)

func _use():
	dialog_static.show_dialog("You’re kidding, that already took hours to get in here.", "liam", 7.0)
