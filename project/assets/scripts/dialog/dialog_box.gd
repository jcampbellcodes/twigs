extends RichTextLabel

var delta_time = 0
export var speedMult = 10
var speed = 10.0
export(String, MULTILINE) var dialogue_text = ""
export var confirm_action = "ui_accept"
var current_page = 0
var pages = []

func start():
	speed = 1.0/speedMult
	visible_characters = 0
	parse_dialogue_text()
	text = pages[current_page]
	set_process_input(true)
	set_physics_process(true)

func end():
	pass

func _ready():
	set_process_input(false)
	set_physics_process(false)

func parse_dialogue_text():
	pages = dialogue_text.split(";")
	for i in range(pages.size()):
		pages[i] = pages[i].replace("\n","")

func text_advance():
	if(text.length() == visible_characters):
		current_page = current_page + 1
		visible_characters = 0
		delta_time = 0
		if(pages.size() - 1 >= current_page):
			text = pages[current_page]
		else:
			self.emit_signal("dialog_end")
			get_parent().queue_free()
			

func text_update():
	if(text.length() > visible_characters):
		visible_characters = visible_characters + 1

func _input(event):
	if(event.is_action_pressed(confirm_action)):
		if(visible_characters == text.length()):
			text_advance()
		else:
			visible_characters = text.length()

func _physics_process(delta):
	if(delta_time > speed):
		delta_time = 0
		text_update()
	delta_time = delta_time + delta
