if(sound_fade){
	var _sound = audio_play_sound_on(global.music_emit,sound_asset, loop, 1, 0);
	audio_sound_gain(_sound, gain, sound_fade_time);
}else{
	var _sound = audio_play_sound_on(global.music_emit, sound_asset, loop, 1, gain);
}