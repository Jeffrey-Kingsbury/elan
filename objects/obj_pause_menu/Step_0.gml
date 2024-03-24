_up_key = input_check_pressed("up");
_down_key = input_check_pressed("down");
_interact_key = input_check_pressed("interact");
_back_key = input_check_pressed("pause");

op_length = array_length(option[menu_level])
pos += _down_key - _up_key;

if(_up_key != 0 || _down_key != 0){
	audio_play_sound(snd_menu_opt_switch_chime, 1, false, 0.5, 0, 1);	
}

if(_interact_key != 0){
	audio_play_sound(snd_menu_opt_selected_chime, 1, false, 0.5, 0, 1);
}

if(_back_key != 0){
	audio_play_sound(snd_menu_opt_selected_chime, 1, false, 0.5, 0, 0.5);
}

if(pos >= op_length){
	pos = 0;	
}

if(pos < 0) {
	pos = op_length -1
}

if(_interact_key){
	var _sml = menu_level;
switch(menu_level){
	case 0:
		switch(pos){
		case 0:
			// Close the pause menu
		break;
	
		case 1:
			menu_level = 1; //Settings
		break;
	
		case 2:
			// Save
		break;
		
		case 3:
			// Exit
			menu_level = 2;
		break;
}
	break;
	
	case 1:
			switch(pos){
			case 0:
			break;
			
			case 1:
			break;
			
			case 2:
				menu_level = 0;
			break;
		}
	break;
	
	case 2:
		switch(pos){
			case 0:
				game_end();
			break;
			
			case 1:
				menu_level = 0;
			break;
		}
	break;
}
if(_sml != menu_level) {pos = 0}
op_length = array_length(option[menu_level])

}

if(_back_key){
if(menu_level != 0){
	pos = 0;
	menu_level = 0;
} else {
// Close the pause menu	
}
}