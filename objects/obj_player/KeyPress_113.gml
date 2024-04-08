var _save_data = get_saves();
for(var _i = 0; _i < array_length(_save_data); _i++){
		var _data = {
		"name" : _save_data[_i].player_name,
		"slot" : _save_data[_i].save_slot
		}
		show_message(_data);
}