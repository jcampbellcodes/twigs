extends "res://assets/scripts/entities/item.gd"

func _talk():
	dialog_static.show_dialog("I know it looks like it’s gonna break,; but it was 20 bucks, come on!", "liam", 10.0)

func _look():
	dialog_static.show_dialog("That’s a cabinet we got from Merle Baysmith down the; road. It was 20 bucks!", "liam", 10.0)

func _use():
	dialog_static.show_dialog("No way I’m moving that anywhere.", "liam", 10.0)
