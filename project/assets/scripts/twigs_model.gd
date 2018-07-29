extends Node2D

var current_action = "look"

func _action_changed(action):
    print("action changed from "+current_action+" to "+action)
    current_action = action