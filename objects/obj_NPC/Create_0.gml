if(!pathing && !does_not_move){
	//random movement
	alarm[0] = random(120);
};

if(pathing){
//pathing logic here	
}

spd = 0;
ran_x = 0;
ran_y = 0;

sprite[RIGHT] = sprite_right;
sprite[UP] = sprite_up;
sprite[LEFT] = sprite_left;
sprite[DOWN] = sprite_down;
sprite[IDLE_RIGHT] = sprite_idle_right;
sprite[IDLE_UP] = sprite_idle_up;
sprite[IDLE_LEFT] = sprite_idle_left;
sprite[IDLE_DOWN] = sprite_idle_down;

face = IDLE_DOWN;