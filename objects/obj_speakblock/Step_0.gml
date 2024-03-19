if(destroy){
	instance_destroy();	
}

if(!instance_exists(obj_textbox))
{
	if(clickable){
		if(position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)){
			if(create_tb){
			create_textbox(text_id);
			}
		}
	}else{
			if(create_tb){
			create_textbox(text_id);
			}
	}
}