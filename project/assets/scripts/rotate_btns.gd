extends TextureButton

export var RotateSpeed = 5
export var Radius = 100
var _centre
var _angle = 0

func _ready():
    set_process(true)
    _centre = self.rect_global_position

func _process(delta): 
    _angle += RotateSpeed * delta;

    var offset = Vector2(sin(_angle), cos(_angle)) * Radius;
    var pos = _centre + offset
    self.rect_global_position = pos
