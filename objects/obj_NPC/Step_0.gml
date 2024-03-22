mask_index = sprite[DOWN];
sprite_index = sprite[face];

if (instance_exists(obj_player)) {
    if (y > obj_player.y) {
        depth = obj_player.depth - 1;
    } else {
        depth = obj_player.depth + 1;
    }
}

if (talking) {
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
            face = IDLE_DOWN; 
        } else {
            face = IDLE_UP; 
        }
    }

    if (!instance_exists(obj_textbox) && !text_open) {
        text_open = true;
        create_textbox(talking_text);    
    }
    exit;
}

if (instance_exists(obj_textbox)) {
    speed = 0;
    exit;
}

if (text_open) { 
    exit;
}

if (!talking) {
    var _next_x = x + speed;
    var _next_y = y + speed;
    if (place_meeting(x, _next_y, obj_wall) || place_meeting(_next_x, y, obj_wall)) {
        speed = 0;
    }

    if (speed == 0) {
        // Set idle direction when there's no movement
        switch (face) {
            case RIGHT: face = IDLE_RIGHT; direction = 0; break;
            case UP: face = IDLE_UP; direction = 90; break;
            case LEFT: face = IDLE_LEFT; direction = 180; break;
            case DOWN: face = IDLE_DOWN; direction = 270; break;
        }
    }
}
