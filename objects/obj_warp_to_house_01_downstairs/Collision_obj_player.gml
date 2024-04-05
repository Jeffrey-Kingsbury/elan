if(instance_exists(obj_textbox)) exit;

var _has_key = false;
var _key_index = -1;
var _warping = false;

if(_warping){ exit };

for(var _x = 0; _x < array_length(global.player_inventory); _x++){
	if(global.player_inventory[_x].item_id = "key_bed_01"){
	_key_index = _x;
	_has_key = true;	
	}
	if(_has_key) break;
}

if(_has_key || array_contains(global.visited_rooms, "rm_house_01_upstairs")){
		inst_house_01_player.block_input = true;
		_warping = true;
		audio_stop_all();
		inst_house_01_fader.fade_dir = "in";
		inst_house_01_fader.fader = true;
		inst_house_01_fader.fade_speed = 0.05;
		audio_play_sound(snd_door_open_close, 1, false);	
		array_delete(global.player_inventory, _key_index, 1);
		alarm[0] = 1;
		save_game();
		
} else {
	 if(!player_collide){
		set_player_face_to_idle()
		create_textbox("bed_01_need_key", true);
		inst_house_01_keys_prompt.is_visible = true;
		player_collide = true;	 
	 }
}