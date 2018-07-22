extends Control

var confirm_popup = null
var labels = []

func button_clicked():
	# play a clicking sound here?
	pass

func newgame_pressed():
	button_clicked()
	start_new_game(true)

func start_new_game(p_confirm):
	get_tree().change_scene("res://scenes/apartment/apartment.tscn")

func continue_pressed():
	button_clicked()

func settings_pressed():
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
	get_node("new_game").connect("pressed", self, "newgame_pressed")
	get_node("continue").connect("pressed", self, "continue_pressed")
	get_node("exit").connect("pressed", self, "_on_exit_pressed")
	if has_node("settings"):
		get_node("settings").connect("pressed", self, "settings_pressed")
	set_process_input(true)

