function save_game(){
	var _file = file_text_open_write("save.json");
	
	var _save = json_stringify({
		"player_name": global.player_name,
		"player_x": global._player_x,
		"player_y": global._player_y,
		"player_room": global._player_room,
		"player_visited_rooms": global.visited_rooms,
		"player_inventory": global.player_inventory,
		"player_seen_news": global._player_seen_news
	});
	file_text_write_string(_file, _save);
	file_text_close(_file);
}

function load_game(){
	var _file = file_text_open_read("save.json");
	var _json = file_text_read_string(_file);
	var _data = json_parse(_json);

	room = _data.player_room;
	global.player_name = _data.player_name;
	global._player_room = _data.player_room;
	global._player_x = _data.player_x;
	global._player_y = _data.player_y;
	global.visited_rooms = _data.player_visited_rooms;
	global.player_inventory = _data.player_inventory;

}