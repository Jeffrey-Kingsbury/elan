_up_key = input_check_pressed("up");
_down_key = input_check_pressed("down");
_interact_key = input_check_pressed("interact");

pos += _down_key - _up_key;

if(pos >= op_length){
	pos = 0;	
}

if(pos < 0) {
	pos = op_length -1
}

if(_interact_key){

switch(pos){
	default:
		show_debug_message(option[pos]);
	break;
	
	case 0:
		show_debug_message(option[pos]);
	break;
	
	case 1:
		show_debug_message(option[pos]);
	break;
	
	case 2:
		show_debug_message(option[pos]);
	break;
}
}