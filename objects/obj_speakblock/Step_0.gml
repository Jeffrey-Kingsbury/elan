if(position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left) && !instance_exists(obj_textbox))
{
	with(instance_create_depth(0,0,-9999, obj_textbox)){
		scr_text("You've clicked on me!");
		scr_text("Congratulations!");

	
	}
}