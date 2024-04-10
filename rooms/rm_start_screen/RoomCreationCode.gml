global.sfx_emit = audio_emitter_create();
global.music_emit = audio_emitter_create();

if(file_exists("vol.json")){
	var _file = file_text_open_read("vol.json");
	var _json = file_text_read_string(_file);
	var _data = json_parse(_json);
	global.music_vol = _data.music_vol;
	global.sfx_vol = _data.sfx_vol;
	audio_emitter_gain(global.music_emit, _data.music_vol);
	audio_emitter_gain(global.sfx_emit, _data.sfx_vol);
} else {
	var _save_file_name = "vol.json";
	var _save = {
	"music_vol": 1,
	"sfx_vol": 1
	}
	var _file = file_text_open_write(_save_file_name);
	file_text_write_string(_file, json_stringify(_save));
	file_text_close(_file);
  
}

var _sound = audio_play_sound_on(global.music_emit, snd_intro_credit_menu, 1, true, 0);
audio_sound_gain(_sound, 1, 5000);
