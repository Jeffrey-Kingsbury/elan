if(!instance_exists(obj_textbox))
{
	if(clickable){
		if(position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left)){
			create_textbox(text_id);
		}
	}else{
		create_textbox(text_id);
	}
}