global.player_inventory = [];

global.update_inventory = function(_item, _qty, _sprite) {
    var _arr_length = array_length(global.player_inventory);
    var _item_found = false;

	if(_arr_length >= 14){
		if(!instance_exists(obj_textbox)) create_textbox("inventory_full");
		exit;	
	}
    for (var _x = 0; _x < _arr_length; _x++) {
        if (global.player_inventory[_x].label == _item) {
           _item_found = true;

            if (global.player_inventory[_x].qty + _qty <= 0) {
                array_delete(global.player_inventory, _x, 1);
            } else {
                global.player_inventory[_x].qty += _qty;
            }

            break; // No need to continue checking once the item is found
        }
    }

    if (!_item_found) {
        array_push(global.player_inventory, { label: _item, qty: _qty, sprite: _sprite });
    }
}
