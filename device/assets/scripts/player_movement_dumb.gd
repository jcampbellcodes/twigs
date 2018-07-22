extends KinematicBody2D

export (int) var speed = 200

var target = Vector2()
var velocity = Vector2()

func _ready():
	target = position

func _input(event):
	if event is InputEventMouseButton:
        target = get_global_mouse_position()

func _physics_process(delta):
    velocity = (target - position).normalized() * speed
    # rotation = velocity.angle()
    if (target - position).length() > 5:
        var collision_info = move_and_slide(velocity)