extends "res://assets/scripts/entities/item.gd"

func _talk():
	dialog_static.show_dialog("Ah ye olde television, now only a monitor for streaming services!", "liam", 10.0)

func _look():
	dialog_static.show_dialog("(transitions to full screen without liam in frame)", "liam", 20.0)

func _use():
	dialog_static.show_dialog("We -yaint’ movin’ anywhere scout!", "liam", 7.0)
