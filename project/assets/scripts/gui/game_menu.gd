extends Control

var confirm_popup = null
var labels = []

func button_clicked():
	# play a clicking sound here?
	pass

func mainmenu_pressed():
	button_clicked()
	get_tree().change_scene("res://scenes/gui/menus/main_menu.tscn")

func settings_pressed():
	button_clicked()

func _settings_pressed():
	button_clicked()

func _on_exit_pressed():
	button_clicked()
	_quit_game()

func _quit_game():
	get_tree().quit()

func _find_labels(p = null):
	if p == null:
		p = self
	if p is Label:
		labels.push_back(p)
	for i in range(0, p.get_child_count()):
		_find_labels(p.get_child(i))

func _ready():
	get_node("main_menu").connect("pressed", self, "mainmenu_pressed")
	get_node("settings").connect("pressed", self, "_settings_pressed")
	get_node("quit").connect("pressed", self, "_on_exit_pressed")
	if has_node("settings"):
		get_node("settings").connect("pressed", self, "settings_pressed")
	set_process_input(true)

