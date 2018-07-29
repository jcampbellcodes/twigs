extends TextureButton

func _pressed():
	get_node("/root/dialog_static").show_dialog("middle", "Hint: You're shit outta luck", "default", 10.0)
