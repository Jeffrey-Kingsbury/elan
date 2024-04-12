if(!_warping){
_warping = true;
audio_play_sound_on(global.sfx_emit, snd_door_open_close,false,1);	
global.add_to_inventory("wallet", "Money", -50, spr_item_money);
audio_play_sound_on(global.sfx_emit, snd_menu_opt_switch_chime, false, 1);
audio_stop_sound(snd_simple_acoustic_loop);
inst_4CE6936B.fade_dir = "in";
inst_4CE6936B.fader = true;
inst_4CE6936B.fade_speed = 0.08;
alarm[0] = 60;
}
