var _up_key = input_check_pressed("up");
var _down_key = input_check_pressed("down");
var _interact_key = input_check_pressed("interact");
var _back_key = input_check_pressed("pause");


op_length = array_length(option)
pos += _down_key - _up_key;

if(_back_key != 0){
	room_goto(rm_menu);
}


if(_up_key != 0 || _down_key != 0){
	audio_play_sound(snd_menu_opt_switch_chime, 1, false, 0.5, 0, 1);	
}


if(pos >= op_length){
	pos = 0;	
}

if(pos < 0) {
	pos = op_length -1
}

if(_interact_key != 0){
	audio_stop_all();
	audio_play_sound(snd_menu_opt_selected_chime, 1, false, 0.5, 0, 1);
	load_game(pos)	
}