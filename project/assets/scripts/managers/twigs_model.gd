extends Node2D

# global action selected. defaults to look
var current_action = "look"

# dict of strings to bools showing where we at in the game
var _global_flags = {
    "burrito_acquired": true
}

enum ITEM_STATE {
    INACTIVE = 0,
    ACTIVE = 1
}


# dict of whether items are active or not
var _item_active_states = {
    "weed" : ITEM_STATE.ACTIVE,
    "burrito": ITEM_STATE.ACTIVE,
    "soggy_burrito": ITEM_STATE.ACTIVE,
    "tv_remote": ITEM_STATE.ACTIVE,
    "house_key": ITEM_STATE.ACTIVE,
    "butt": ITEM_STATE.ACTIVE,
    "luigi": ITEM_STATE.ACTIVE,
    "mama_mia": ITEM_STATE.ACTIVE,
    "soggy_burrito_2": ITEM_STATE.ACTIVE,
    "to_kings_crown": ITEM_STATE.ACTIVE,
    "to_hallway":ITEM_STATE.ACTIVE,
    "to_apartment": ITEM_STATE.ACTIVE,
    "fridge": ITEM_STATE.ACTIVE,
}

# dict of item ids to item state strings. used for anims, etc
var _actor_states = {}

# TODO -> can we just use call groups to implement this?

func _action_changed(action):
    #print("action changed from "+current_action+" to "+action)
    current_action = action

func get_item_active_state(item_name):
    if(_item_active_states.has(item_name) and _item_active_states[item_name] == ITEM_STATE.ACTIVE):
        return true
    else:
        return false

func set_item_active(item_name, active):
    if(_item_active_states.has(item_name)):
        if(active == true):
            _item_active_states[item_name] = ITEM_STATE.ACTIVE
        else:
            _item_active_states[item_name] = ITEM_STATE.INACTIVE

# add 