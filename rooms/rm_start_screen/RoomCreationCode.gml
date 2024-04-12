
if(file_exists("settings.json")){
	var _file = file_text_open_read("settings.json");
	var _json = file_text_read_string(_file);
	var _data = json_parse(_json);
	global.fullscreen = _data.fullscreen;
	global.resolution = _data.resolution;
	global.master_vol = _data.master_vol;
	global.music_vol = _data.music_vol;
	global.sfx_vol = _data.sfx_vol;
	audio_master_gain(_data.master_vol);
	audio_emitter_gain(global.music_emit, _data.music_vol);
	audio_emitter_gain(global.sfx_emit, _data.sfx_vol);
	change_resolution(_data.resolution);
	window_set_fullscreen(_data.fullscreen);
	
	
} else {
	var _save_file_name = "settings.json";
	var _save = {
	"fullscreen":true,
	"resolution": 3,
	"master_vol": 1,
	"music_vol": 1,
	"sfx_vol": 1
	}
	global.fullscreen = true;
	change_resolution(3)
	window_set_fullscreen(true);
	var _file = file_text_open_write(_save_file_name);
	file_text_write_string(_file, json_stringify(_save));
	file_text_close(_file);
}



var _sound = audio_play_sound_on(global.music_emit, snd_intro_credit_menu, 1, true, 0);
audio_sound_gain(_sound, 1, 5000);
