if(instance_exists(obj_textbox)) exit;

var _has_key = false;

for(var _x = 0; _x < array_length(global.player_inventory); _x++){
	if(global.player_inventory[_x].item_id = "key_bed_01"){
	_has_key = true;	
	}
	if(_has_key) break;
}

if(_has_key){
	instance_create_depth(0,0, -9999, obj_fade);
	audio_play_sound(snd_door_open_close, 1, false);	
	
	room_goto(Room1);
} else {
	 if(!player_collide){
		 create_textbox("bed_01_need_key", true);
	player_collide = true;	 
	 }
}