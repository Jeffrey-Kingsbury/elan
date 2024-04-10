function change_sfx_volume(vol){
	global.sfx_vol = vol;
	audio_emitter_gain(global.sfx_emit, vol);
	save_volume();
}

function change_music_volue(vol){
	global.music_vol = vol;
	audio_emitter_gain(global.music_emit, vol);
	save_volume();
}

function save_volume(){
if(file_exists("vol.json")){
	var _save_file_name = "vol.json";
	var _save = {
	"music_vol": global.music_vol,
	"sfx_vol": global.sfx_vol
	}
	var _file = file_text_open_write(_save_file_name);
	file_text_write_string(_file, json_stringify(_save));
	file_text_close(_file);
  
}	
}