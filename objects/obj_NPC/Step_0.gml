mask_index = sprite[DOWN];
sprite_index = sprite[face];

if (instance_exists(obj_player)) {
    if (y > obj_player.y) {
        depth = obj_player.depth - 1;
    } else {
        depth = obj_player.depth + 1;
    }
}

if (instance_exists(obj_textbox)) {
    speed = 0;
    exit;
}

if (collision_line(obj_player.x, obj_player.y, obj_player.x + lengthdir_x(16, obj_player.direction), obj_player.y + lengthdir_y(16, obj_player.direction), self, 0, 0)) {
    if (talking_text != "") {
        _show_overhead = true;
    } 
    if (input_check_pressed("interact") && !instance_exists(obj_textbox) && talking_text != "") {
            speed = 0;
            var _player_x = obj_player.x;
            var _player_y = obj_player.y;
            var _x_difference = _player_x - x;
            var _y_difference = _player_y - y;

            if (abs(_x_difference) > abs(_y_difference)) {
                // Player is more horizontally distant
                if (_player_x > x) {
                    face = IDLE_RIGHT;
                } else {
                    face = IDLE_LEFT;
                }
            } else {
                // Player is more vertically distant
                if (_player_y > y) {
                    face = IDLE_DOWN; // Assuming IDLE_DOWN is the sprite for facing downwards
                } else {
                    face = IDLE_UP; // Assuming IDLE_UP is the sprite for facing upwards
                }
            }

            if (!instance_exists(obj_textbox)) {
                set_player_face_to_idle();
                create_textbox(talking_text);    
            }
        }
    } else {
        _show_overhead = false;
    }

