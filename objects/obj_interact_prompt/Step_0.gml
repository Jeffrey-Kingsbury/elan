visible = is_visible;

if(obj_player){
depth = obj_player.depth + 1;
}

if(collision_line(obj_player.x, obj_player.y, obj_player.x + lengthdir_x(32, obj_player.direction), obj_player.x + lengthdir_y(32, obj_player.direction), self, 0, 0)){
		draw_icon = true;
		
		if(input_check("interact") == 1){
			if(text_id != "" && !instance_exists(obj_textbox)){
				create_textbox(text_id, true);
				instance_destroy();
		
			}
		}
		
} else {
	draw_icon = false;
}