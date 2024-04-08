if(count_saves() > 0){
	audio_stop_all();
	room_goto(rm_load_menu);
} else {
	game_end()
}