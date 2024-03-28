visible = is_visible;

if (obj_player) {
    depth = obj_player.depth + 1;
}

					 
if (collision_line(obj_player.x, obj_player.y, obj_player.x + lengthdir_x(32, obj_player.direction), obj_player.x + lengthdir_y(32, obj_player.direction), self, 0, 0)) {
    draw_icon = true;

    if (input_check_pressed("interact") == 1) {

        if (text_id != "" && !instance_exists(obj_textbox)) {
            var _ran_text = irandom(array_length(text_id) - 1);
			
			if(_is_news){
				if(!array_contains(global._player_seen_news, text_id[_ran_text])){
				array_push(global._player_seen_news, text_id[_ran_text])
				}
			}
			
            create_textbox(text_id[_ran_text], true);
			
            if (remove_after_reading) {
                if (array_length(text_id) == 1) {
                    instance_destroy();
                }
                array_delete(text_id, _ran_text, 1);
            }
        }
    }
} else {
    draw_icon = false;
}
