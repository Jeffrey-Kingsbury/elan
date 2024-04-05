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
sprite[ATTACK_RIGHT] = spr_player_attack_right;
sprite[ATTACK_LEFT] = spr_player_attack_left;
sprite[ATTACK_UP] = spr_player_attack_up;
sprite[ATTACK_DOWN] = spr_player_attack_down;
sprite[READING_DOWN] = spr_player_sitting_reading_down
sprite[CELL_DOWN] = spr_player_sitting_cell_down
face = IDLE_DOWN;

is_pooping = false;
set_poop_face = false;
draw_exit_pooping = false;


global._player_room = room;