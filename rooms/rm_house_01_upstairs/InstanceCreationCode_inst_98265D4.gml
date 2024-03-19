if(array_contains(global.visited_rooms, "rm_house_01_upstairs")){
	instance_destroy();	

	} else {
		sound_asset = snd_thunder_int;
		sound_fade = true;
		sound_fade_time = 5000;
}