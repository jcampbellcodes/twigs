extends Node2D

var node = null

var showing_dialog = false

func show_dialog(text, speaker, speed):
	print("try to show dialog: ")
	if(showing_dialog):
		print("not showing dialog")
		return

	print("showing dialog")

	var scene = load("res://scenes/gui/dialogs/dialog_"+speaker+".tscn")
	var pos = get_node("dialog_pos").global_position
	var node = scene.instance()
	add_child(node)
	node.global_position = pos
	var dialog_text = node.get_node("box").get_node("text")
	dialog_text.speedMult = speed
	dialog_text.dialogue_text = text
	dialog_text.start()
	show_mask()
	dialog_text.add_user_signal("dialog_end")
	dialog_text.connect("dialog_end", self, "hide_mask")

func show_mask():
	showing_dialog = true
	print("mask enabled")
	get_node("mask").show()
	
func hide_mask():
	showing_dialog = false
	print("mask disabled")
	get_node("mask").hide()


