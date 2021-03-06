extends Node

# Load the custom images for the mouse cursor
var cursor_default = load("res://assets/art/buttons/cursor/cursordef_small.png")
var cursor_hover = load("res://assets/art/buttons/cursor/highcursor_small.png")

func _ready():
    # Changes only the arrow shape of the cursor
    # This is similar to changing it in the project settings
    Input.set_custom_mouse_cursor(cursor_default)

    # Changes a specific shape of the cursor (here the IBeam shape)
    Input.set_custom_mouse_cursor(cursor_hover, Input.CURSOR_POINTING_HAND)
