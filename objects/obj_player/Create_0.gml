xspeed = 0;
yspeed = 0;
move_speed = 1;
last_direction = 0
h_input = 0;
v_input = 0;
_max_edge_tolerance = 20;

sprite[RIGHT] = spr_player_walk_right;
sprite[UP] = spr_player_walk_up;
sprite[LEFT] = spr_player_walk_left;
sprite[DOWN] = spr_player_walk_down;
sprite[IDLE_RIGHT] = spr_player_idle_right;
sprite[IDLE_UP] = spr_player_idle_up;
sprite[IDLE_LEFT] = spr_player_idle_left;
sprite[IDLE_DOWN] = spr_player_idle_down;

face = IDLE_DOWN;

global._player_room = room;