if(!_warping){
_warping = true;
audio_play_sound(snd_door_open_close, 1, false);
audio_stop_sound(snd_simple_acoustic_loop);
inst_4CE6936B.fade_dir = "in";
inst_4CE6936B.fader = true;
inst_4CE6936B.fade_speed = 0.08;
alarm[0] = 60;
}
