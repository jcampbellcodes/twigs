extends "res://assets/scripts/entities/item.gd"

func _talk():
	dialog_static.show_dialog("What the fuck", "liam", 7.0)

func _look():
	dialog_static.show_dialog("Well would you look at that! Weed!; Golly!", "liam", 20.0)

func _use():
	dialog_static.show_dialog("I'll just be grabbing that....; Lol", "liam", 20.0)
	inventory_manager.add_item(self.name)
	self.hide()
	twigs_model.set_item_active(self.name, false)
