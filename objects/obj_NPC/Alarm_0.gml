alarm[0] = 120;
speed = 0;

if (talking) { 
    exit;
}

if (instance_exists(obj_textbox)) { 
    exit;
}

// Set new random destination
var _destination_x = random(room_width);
var _destination_y = random(room_height);

// Set speed
var _move_speed = 0.75; // Adjust speed as needed
var _stop = choose(true, false);

if (_stop) {
    exit;
} else {
    speed = _move_speed;
    move_towards_point(_destination_x, _destination_y, _move_speed);
}

// Determine movement speeds
var _h_speed = _destination_x - x;
var _v_speed = _destination_y - y;

// Set sprite direction based on movement
if (abs(_h_speed) > 0 || abs(_v_speed) > 0) {
    if (abs(_h_speed) > abs(_v_speed)) {
        if (_h_speed > 0) {
            face = RIGHT;
        } else if (_h_speed < 0) {
            face = LEFT;
        }
    } else {
        if (_v_speed > 0) {
            face = DOWN;
        } else if (_v_speed < 0) {
            face = UP;
        }
    }
}
