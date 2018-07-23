extends Node
export(Script) var animations

var terrain
var walk_path
var walk_context
var moved
var last_scale = Vector2(1, 1)
var last_dir = 0
var animation
var state = ""
var walk_destination
var path_ofs
var pose_scale = 1
var task
var sprites = []

export var speed = 300
export var scale_on_map = false
export var light_on_map = false setget set_light_on_map

func set_light_on_map(p_light):
	light_on_map = p_light
	if light_on_map:
		_update_terrain()
	else:
		modulate(Color(1, 1, 1, 1))

func modulate(color):
	for s in sprites:
		s.set_modulate(color)

func _process(time):
	_update_terrain()

func _find_sprites(p = null):
	if p is Sprite || p is AnimatedSprite || p is TextureRect || p is TextureButton:
		sprites.push_back(p)
	for i in range(0, p.get_child_count()):
		_find_sprites(p.get_child(i))

func _ready():
	if has_node("../terrain"):
		terrain = get_node("../terrain")

	_find_sprites(self)

	if Engine.is_editor_hint():
		return
	if has_node("animation"):
		animation = get_node("animation")
