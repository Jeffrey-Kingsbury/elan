var _warping = false;

if(_warping){ exit };

		inst_house_01_downstairs_player.block_input = true;
		_warping = true;
		audio_stop_all();
		inst_4CE6936B.fade_dir = "in";
		inst_4CE6936B.fader = true;
		inst_4CE6936B.fade_speed = 0.05;
		audio_play_sound_on(global.sfx_emit, snd_door_open_close,false,1);	
		alarm[0] = 1;
	
