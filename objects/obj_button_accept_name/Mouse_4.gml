event_inherited();
instance_create_depth(0,0, -9999, obj_fade);
save_game(count_saves());
room_goto(rm_intro)

audio_sound_gain(snd_intro_credit_menu, 0, 2000);
alarm[0] = 30;