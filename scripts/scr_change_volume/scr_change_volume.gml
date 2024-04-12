function change_sfx_volume(vol){
	global.sfx_vol = vol;
	audio_emitter_gain(global.sfx_emit, vol);
	save_volume();
}

function change_music_volume(vol){
	global.music_vol = vol;
	audio_emitter_gain(global.music_emit, vol);
	save_volume();
}

function change_master_volume(vol){
	global.master_vol = vol;
	audio_master_gain(vol);
	save_volume();
}


function save_volume(){
if(file_exists("settings.json")){
	var _file = file_text_open_read("settings.json");
	var _json = file_text_read_string(_file);
	var _data = json_parse(_json);
	_data.master_vol = global.master_vol;
	_data.music_vol = global.music_vol;
	_data.sfx_vol = global.sfx_vol;
	file_text_close(_file);
	_file = file_text_open_write("settings.json");
	file_text_write_string(_file, json_stringify(_data));
	file_text_close(_file);
}	
}