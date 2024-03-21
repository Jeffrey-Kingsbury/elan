if(talking){
alarm[2] = 5;
}

if(collision_line(obj_player.x, obj_player.y, obj_player.x + lengthdir_x(400, obj_player.direction), obj_player.x + lengthdir_y(400, obj_player.direction), self, 0, 0) && !instance_exists(obj_textbox))
    {
if(talking_text != ""){
speed = 0;
talking = true;
var _player_x = obj_player.x;
var _player_y = obj_player.y;
var _x_difference = _player_x - x;
var _y_difference = _player_y - y;

if(abs(_x_difference) > abs(_y_difference)) {
    // Player is more horizontally distant
    if(_player_x > x) {
        face = IDLE_RIGHT;
    } else {
        face = IDLE_LEFT;
    }
} else {
    // Player is more vertically distant
    if(_player_y > y) {
        face = IDLE_DOWN; // Assuming IDLE_DOWN is the sprite for facing downwards
    } else {
        face = IDLE_UP; // Assuming IDLE_UP is the sprite for facing upwards
    }
}	
}
	}