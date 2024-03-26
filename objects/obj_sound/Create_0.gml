if(sound_fade){
	var _sound = audio_play_sound(sound_asset, 1, loop, 0);
	audio_sound_gain(_sound, gain, sound_fade_time);
}else{
	var _sound = audio_play_sound(sound_asset, gain, loop);
}