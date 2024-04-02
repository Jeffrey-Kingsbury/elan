		draw_self();
		
		if(_show_overhead && !talking && !instance_exists(obj_textbox)){
		draw_sprite_ext(spr_thinking_dots_animated, -1, x - 8, y - 32, 1, 1, 0, c_white, 1);	
		}