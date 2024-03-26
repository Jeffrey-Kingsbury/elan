if(_init){
	if(!instance_exists(obj_textbox)) {
			inst_bed_01_upstairs_menu.menu_active = true;
			var _sound = audio_play_sound(snd_simple_acoustic_loop, 1, true, 0);
			audio_sound_gain(_sound, 1, 5000);
			instance_destroy();
	}
}
