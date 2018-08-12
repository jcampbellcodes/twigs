extends "res://assets/scripts/entities/item.gd"

func _talk():
	dialog_static.show_dialog("What the fuck", "liam", 10.0)

func _look():
	dialog_static.show_dialog("Well would you look at that! Weed!; Golly!", "liam", 20.0)

func _use():
	inventory_manager.set_queued_item(self.name)
