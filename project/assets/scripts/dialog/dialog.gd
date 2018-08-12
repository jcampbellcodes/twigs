extends Node2D

func show_dialog(text, speaker, speed):
	var scene = load("res://scenes/gui/dialogs/dialog_"+speaker+".tscn")
	var pos = get_node("dialog_pos").global_position
	var node = scene.instance()
	add_child(node)
	node.global_position = pos
	var dialog_text = node.get_node("box").get_node("text")
	dialog_text.speedMult = speed
	dialog_text.dialogue_text = text
	dialog_text.start()
