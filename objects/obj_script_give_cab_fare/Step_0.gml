if(!instance_exists(obj_textbox)){
		global.add_to_inventory("wallet", "Money", 50, spr_item_money);
		audio_play_sound_on(global.sfx_emit, snd_menu_opt_selected_chime, false, 1);
		save_game(global._save_slot);
		instance_destroy();
}