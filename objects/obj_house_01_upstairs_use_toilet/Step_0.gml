visible = true;
image_alpha = 0;

if (collision_line(obj_player.x, obj_player.y, obj_player.x + lengthdir_x(1, obj_player.direction), obj_player.y + lengthdir_y(16, obj_player.direction), self, 0, 0)) {
    draw_icon = true;

    if (input_check_pressed("interact") == 1) {
		if(!inst_house_01_player.is_pooping){
			inst_house_01_player.is_pooping = true;
			inst_house_01_player.x = 344;
			inst_house_01_player.y = 170;
		} else {
			inst_house_01_player.is_pooping = false;
			inst_house_01_player.x = 344;
			inst_house_01_player.y = 190;
		}
        
    }
} else {
    draw_icon = false;
}
