if(_init){
	if(!instance_exists(obj_textbox)) {
			instance_create_depth(0, 0, 1, obj_menu)
			var _sound = audio_play_sound_on(global.music_emit, snd_simple_acoustic_loop, true, 1, 0);
			audio_sound_gain(_sound, 1, 5000); 
			instance_destroy();
	}
}
