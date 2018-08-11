extends Node2D

# global action selected. defaults to use
var current_action = "use"

# dict of strings to bools showing where we at in the game
var global_flags = {}

# dict of item ids to item state strings
var item_states = {}

# dict of whether items are active or not
var item_active_states = {}

# TODO -> can we just use call groups to implement this?

func _action_changed(action):
    print("action changed from "+current_action+" to "+action)
    current_action = action

# add 