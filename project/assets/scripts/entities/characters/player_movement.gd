extends KinematicBody2D

var task
var walk_destination
var terrain
var walk_path
var walk_context
var path_ofs
export var speed = 300
export var v_speed_damp = 1.0
export(Color) var dialog_color = null
var last_dir = 0
var last_scale
var pose_scale = 1
var params_queue
var camera
export var camera_limits = Rect2()

export var telekinetic = false

var anim_notify = null
var anim_scale_override = null
var sprites = []
export var placeholders = {}

var _can_move = true

var target = Vector2()

func set_can_move(can_move):
	_can_move = can_move

func _unhandled_input(event):
	if event is InputEventMouseButton:
		target = get_global_mouse_position()
		#walk_to(target)

func set_active(p_active):
	if p_active:
		show()
	else:
		hide()

func walk_to(pos, context = null):
	if(not _can_move):
		return

	walk_path = terrain.get_path(get_position(), pos)
	walk_context = context
	if walk_path.size() == 0:
		task = null
		walk_stop(get_position())
		set_process(false)
		return
	walk_destination = walk_path[walk_path.size()-1]
	if terrain.is_solid(pos):
		walk_destination = walk_path[walk_path.size()-1]
	path_ofs = 0.0
	task = "walk"
	set_process(true)

func walk(pos, speed, context = null):
	if(not _can_move):
		return
		
	walk_to(pos, context)

func _find(p_val, p_array, p_flip):
	var i = 0
	for v in p_array:
		if typeof(v) == typeof(p_val) && v == p_val:
			if p_flip == null:
				return i
			else:
				if p_array[i+1] == p_flip:
					return i

		i += 1
	return -1

func walk_stop(pos):
	# Notify exits of stop position
	get_tree().call_group_flags(SceneTree.GROUP_CALL_DEFAULT, "exit", "stopped_at", pos)

	set_position(pos)
	walk_path = []
	task = null
	set_process(false)
	if params_queue != null:
		get_tree().call_group_flags(SceneTree.GROUP_CALL_DEFAULT, "game", "interact", params_queue)
		# Clear params queue to prevent the same action from being triggered again
		params_queue = null

	_update_terrain()

func _get_dir(angle):
	var deg = rad2deg(angle) + 180
	return _get_dir_deg(deg)

func _get_dir_deg(deg):
	var dir = 0
	var i = 0
	return dir

func _notification(what):
	#if !get_tree() || !Engine.is_editor_hint():
	#	return

	if what == CanvasItem.NOTIFICATION_TRANSFORM_CHANGED:
		call_deferred("_editor_transform_changed")

func _editor_transform_changed():
	_update_terrain()
	_check_bounds()

func _check_bounds():
	if !terrain:
		return

	#printt("checking bouds for pos ", get_position(), terrain.is_solid(get_position()))
	# if terrain.is_solid(get_position()):
	# 	if has_node("terrain_icon"):
	# 		get_node("terrain_icon").hide()
	# else:
	# 	if !has_node("terrain_icon"):
	# 		var node = Sprite.new()
	# 		var tex = load("res://globals/terrain.png")
	# 		node.set_texture(tex)
	# 		add_child(node)
	# 		node.set_name("terrain_icon")
	# 	get_node("terrain_icon").show()

func _update_terrain():
	if !terrain:
		return

	var pos = get_position()
	var color = terrain.get_terrain(pos)
	var scal = terrain.get_scale_range(color.b)
	scal.x = scal.x * pose_scale
	if scal != get_scale():
		last_scale = scal
		set_scale(last_scale)
	color = terrain.get_light(pos)
	for s in sprites:
		s.set_modulate(color)

func _process(time):
	if task == "walk":
		var pos = get_position()
		var old_pos = pos
		var next
		if walk_path.size() > 1:
			next = walk_path[path_ofs + 1]
		else:
			next = walk_path[path_ofs]

		var dist = speed * time * pow(last_scale.x, 2) * terrain.player_speed_multiplier
		if walk_context and "fast" in walk_context and walk_context.fast:
			dist *= terrain.player_doubleclick_speed_multiplier
		var dir = (next - pos).normalized()

		# assume that x^2 + y^2 == 1, apply v_speed_damp the y axis
		#printt("dir before", dir)
		dir = dir * (dir.x * dir.x +  dir.y * dir.y * v_speed_damp)
		#printt("dir after", dir, dist)

		var new_pos
		if pos.distance_to(next) < dist:
			new_pos = next
			path_ofs += 1
		else:
			new_pos = pos + dir * dist

		if path_ofs >= walk_path.size() - 1:
			walk_stop(walk_destination)
			return

		pos = new_pos

		var angle = (old_pos.angle_to_point(pos)) * -1
		set_position(pos)

		last_dir = _get_dir(angle)

	_update_terrain()


func _ready():

	if get_parent().has_node("terrain"):
		terrain = get_parent().get_node("terrain")

	if Engine.is_editor_hint():
		return
	
	target = position
	last_scale = get_scale()
	set_process(true)
