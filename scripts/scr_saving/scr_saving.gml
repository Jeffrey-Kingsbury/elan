function save_game(_slot = global._save_slot){
  // Validate _slot number (optional)
  if (_slot < 0) {
    show_message("Error: Invalid save _slot!");
    return false;
  }

	var _save_file_name = "save_" + string(_slot) + ".json";
	var _save = {};
  // Check if save file exists (optional)
  if (!file_exists(_save_file_name)) {
    // Create a new empty save data for this _slot
     _save = {
		"save_slot": int64(_slot),
		"player_name": "",
		"player_x": 119,
		"player_y": 229,
		"player_room": "@ref room(rm_house_01_upstairs)",
		"player_visited_rooms": global.visited_rooms,
		"player_inventory": global.player_inventory,
		"player_seen_news": global._player_seen_news
    };
  } else {
    // Read existing save data
    var _file = file_text_open_read(_save_file_name);
    var _json = file_text_read_string(_file);
    _save = json_parse(_json);
    file_text_close(_file);
  }

  // Update save data
  	_save.player_name = global.player_name;
  if(global._player_room == ""){
	_save.player_x = 119;
	_save.player_y = 229;
	_save.player_room = "@ref room(rm_house_01_upstairs)";
  } else {
	_save.player_x = global._player_x;
	_save.player_y = global._player_y;
	_save.player_room = global._player_room;
  }

  // Write updated save data
  var _file = file_text_open_write(_save_file_name);
  file_text_write_string(_file, json_stringify(_save));
  file_text_close(_file);

  return true; // Indicate successful save
}

function load_game(_slot = global._save_slot){
	audio_stop_all();
	var _file = file_text_open_read("save_" + string(_slot) + ".json");
	var _json = file_text_read_string(_file);
	var _data = json_parse(_json);

	room = _data.player_room;
	global._save_slot = _data.save_slot
	global.player_name = _data.player_name;
	global._player_room = _data.player_room;
	global._player_x = _data.player_x;
	global._player_y = _data.player_y;
	global.visited_rooms = _data.player_visited_rooms;
	global.player_inventory = _data.player_inventory;

}

function count_saves(){
	var _save_count = 0;
	
	for(var _i = 0; _i < 99; _i++){
		var _save_filename = "save_" + string(_i) + ".json";
		if (file_exists(_save_filename)) {
			_save_count++
		} else {
			break;
    }
	}

	return _save_count;
	}

function get_saves(){
	var _total_saves = count_saves();
	var _data = [];
	
	for(var _i = 0; _i < _total_saves; _i++){
	var _file = file_text_open_read("save_" + string(_i) + ".json");
	var _json = file_text_read_string(_file);
	array_push(_data,json_parse(_json));
	}
	
	return _data;
}