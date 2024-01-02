var right_key = keyboard_check(ord("D")); 
var left_key = keyboard_check(ord("A")); 
var up_key = keyboard_check(ord("W")); 
var down_key = keyboard_check(ord("S")); 

// Determine movement speeds
var h_input = right_key - left_key;
var v_input = down_key - up_key;

var h_speed = h_input * move_speed;
var v_speed = v_input * move_speed;

// Collision handling
var next_x = x + h_speed;
var next_y = y + v_speed;

mask_index = sprite[DOWN];
// Set sprite index based on the face direction
sprite_index = sprite[face];

//block controls if a textbox is open
if(instance_exists(obj_textbox)){exit}


if (!place_meeting(next_x, y, obj_wall)) {
    x = next_x;
}

if (!place_meeting(x, next_y, obj_wall)) {
    y = next_y;
}

// Set sprite direction based on movement
var abs_h_speed = abs(h_speed);
var abs_v_speed = abs(v_speed);

if (abs_h_speed > 0 || abs_v_speed > 0) {
    if (abs_h_speed > abs_v_speed) {
        if (h_speed > 0) {
            face = RIGHT;
        } else if (h_speed < 0) {
            face = LEFT;
        }
    } else {
        if (v_speed > 0) {
            face = DOWN;
        } else if (v_speed < 0) {
            face = UP;
        }
    }
} else {
    // Set idle direction when there's no movement
    switch (face) {
        case RIGHT: face = IDLE_RIGHT; break;
        case UP: face = IDLE_UP; break;
        case LEFT: face = IDLE_LEFT; break;
        case DOWN: face = IDLE_DOWN; break;
        case NE: face = IDLE_NE; break;
        case NW: face = IDLE_NW; break;
        case SE: face = IDLE_SE; break;
        case SW: face = IDLE_SW; break;
    }
}


// Set sprite direction for diagonal movement
if (h_speed != 0 || v_speed != 0) {
    if (h_speed > 0 && v_speed > 0) {
        face = SE; //walk SE
    } else if (h_speed < 0 && v_speed > 0) {
        face = SW; //walk SW
    } else if (h_speed > 0 && v_speed < 0) {
        face = NE; //walk NE
    } else if (h_speed < 0 && v_speed < 0) {
        face = NW; //walk NW
    }
}
