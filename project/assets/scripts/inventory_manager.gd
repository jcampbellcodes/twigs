extends Node2D

enum item_state {
    not_in_inventory,
    in_inventory
}

var _inventory_state = {
    "weed" : item_state.not_in_inventory,
    "burrito": item_state.not_in_inventory,
    "soggy_burrito": item_state.not_in_inventory,
    "tv_remote": item_state.not_in_inventory,
    "house_key": item_state.not_in_inventory,
    "butt": item_state.not_in_inventory,
    "luigi": item_state.not_in_inventory,
    "mama_mia": item_state.not_in_inventory,
    "soggy_burrito_2": item_state.not_in_inventory
}

var _current_inventory = [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null
]

var _queued_item = null

# state API
func get_current_inventory():
    return _current_inventory

func get_item_states():
    return _inventory_state

func get_item_state(item_name):
    if(_inventory_state.has(item_name)):
        return _inventory_state[item_name]
    else:
        # item does not exist!
        assert(false)

func get_all_items():
    return _inventory_state.keys()

# item API
func add_item(item_name):
    if(_inventory_state.has(item_name)):
        _inventory_state[item_name] = item_state.in_inventory
        var next_open_slot = _current_inventory.find(null)
        if(next_open_slot >= 0):
            _current_inventory[next_open_slot] = item_name
            print(_current_inventory)
        # send update that item was added
    else:
        # trying to add an item that doesn't exist!
        assert(false)

func remove_item(item_name):
    if(_inventory_state.has(item_name)):
        _inventory_state[item_name] = item_state.not_in_inventory
        var to_remove = _current_inventory.find(item_name)
        if(to_remove >= 0):
            _current_inventory.remove(to_remove)
        else:
            print("Trying to remove an item that's not there!")
            assert(false)

        # TODO -> probably some GUI stuff here or some signals or something
    else:
        # trying to remove an item that doesn't exist!
        assert(false)

func get_queued_item():
    return _queued_item

func set_queued_item(item_name):
    if(_inventory_state.has(item_name)):
        _queued_item = item_name
        print("Queued item is:" + _queued_item)
        # TODO -> probably some GUI stuff here or some signals or something
    else:
        # trying to queue an item that doesn't exist!
        assert(false)

func clear_queued_item():
    _queued_item = null


func show_backpack():
    get_node("backpack").show()

func hide_backpack():
    get_node("backpack").hide()