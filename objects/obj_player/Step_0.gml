var _right_key = input_check("right");
var _left_key = input_check("left");
var _up_key  = input_check("up");
var _down_key  = input_check("down");
v_input = _down_key  - _up_key ;

if(
input_check("run")
&& face != IDLE_DOWN 
&& face != IDLE_LEFT
&& face != IDLE_RIGHT
&& face != IDLE_UP
){
	move_speed = 1.75;	
	image_speed = 1.75;
} else {
	move_speed = 1;	
	image_speed = 1;
}

global._player_x = x;
global._player_y = y;

// Update last_direction based on current input
if (_right_key != 0 && _left_key == 0) {
    last_direction = 1; // Right key pressed
} else if (_left_key != 0 && _right_key == 0) {
    last_direction = -1; // Left key pressed
} else if(_right_key == 0 && _left_key == 0) {
	last_direction = 0; // Neither pressed
}

h_input = last_direction;

// Check if both left and right keys are pressed
// Change the direction to the opposite of the last key pressed instead of 0.
if (_right_key && _left_key) {
	if(last_direction == -1){
		h_input = 1;
	} else if(last_direction = 1){
		h_input = -1;
	}
} 

mask_index = sprite[DOWN];
// Set sprite index based on the face direction
sprite_index = sprite[face];

//block controls if a textbox is open or flag is set
if(instance_exists(obj_textbox)){exit}
if(block_input){exit}

var _h_speed = h_input * move_speed;
var _v_speed = v_input * move_speed;

// Collision handling
var _next_x = x + _h_speed;
var _next_y = y + _v_speed;
if (!place_meeting(_next_x, y, obj_wall)) {
    x = _next_x;
}

if (!place_meeting(x, _next_y, obj_wall)) {
    y = _next_y;
}

// Set sprite direction based on movement
var _abs__h_speed = abs(_h_speed);
var _abs__v_speed = abs(_v_speed);

if (_abs__h_speed > 0 || _abs__v_speed > 0) {
    if (_abs__h_speed > _abs__v_speed) {
        if (_h_speed > 0) {
			
           if(!_attacking){
			   face = RIGHT;
		   } else {
			   	//instance_create_depth(x + 12, y, 1, obj_attack_collider)
				//face = ATTACK_RIGHT
		   }
        } else if (_h_speed < 0) {
            if(!_attacking){
				face = LEFT;
			} else {
				//instance_create_depth(x - 12, y, 1, obj_attack_collider)
				//face = ATTACK_LEFT	
			}
        }
    } else {
        if (_v_speed > 0) {
           if(!_attacking){
			   face = DOWN;
		   } else {
			   	//instance_create_depth(x, y + 12, 1, obj_attack_collider)
				//face = ATTACK_DOWN;	
		}
        } else if (_v_speed < 0) {
           if(!_attacking){
			   face = UP;
		   } else {
			   	//instance_create_depth(x, y - 12, 1, obj_attack_collider)	
				//face = ATTACK_UP;	
		   }
        }
    }
} else {
    // Set idle direction when there's no movement
    switch (face) {
        case RIGHT: face = IDLE_RIGHT; direction = 0; break;
        case UP: face = IDLE_UP; direction = 90; break;
        case LEFT: face = IDLE_LEFT; direction = 180; break;
        case DOWN: face = IDLE_DOWN; direction = 270; break;
    }
}