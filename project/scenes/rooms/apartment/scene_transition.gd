extends "res://assets/scripts/entities/item.gd"

export(String, FILE, ".tscn") var to_scene = ""

func _ready():
	add_to_group("scene_transitions")

func _talk():
	get_tree().change_scene(to_scene)

func _look():
	get_tree().change_scene(to_scene)

func _use():
	get_tree().change_scene(to_scene)