if(sound_fade){
	var _sound = audio_play_sound(sound_asset, 1, true, 0);
	audio_sound_gain(_sound, 1, sound_fade_time);
}else{
	var _sound = audio_play_sound(sound_asset, 1, true);
}