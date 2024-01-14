// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_game_text(_text_id){

switch(_text_id){
	
	case "inventory_full":
		scr_text("You can't carry any more items.");
	break;

	case "bed_01_1":
	scr_text("zzz... zzz... zzz...");
	scr_text("zzz... zzz... zzz...", true, {sound: snd_alarm_clock, loop: false, gain: 1});	
	scr_text("beep beep beep beep...");
	scr_text("beep beep beep beep...");
		scr_option("I'm up!", "bed_01_opt_01")		
		scr_option("Not yet!", "bed_01_opt_02")
	break;
	
		case "bed_01_opt_01":
			audio_stop_sound(snd_alarm_clock)
			audio_play_sound(snd_click, 1, false);
			inst_bed_01_fader.fader = true;
		scr_text("*click*");
		scr_text("wha-... huh?");
		scr_text("Shit. I must have dozed off...");
		scr_text("P's gonna be pissed if I'm late.\nI better get going.");
			instance_destroy(inst_bed_01_dialog_1);
		break;
		
		case "bed_01_opt_02":
		scr_text("BEEP BEEP BEEP BEEP...");
		scr_text("BEEP BEEP BEEP BEEP...");
			scr_option("I'm up!", "bed_01_opt_01")		
			scr_option("Not yet!", "bed_01_opt_02")
		break;
		
}
}

function scr_interactable_text(_text_id){
	switch(_text_id){
		
		case "bed_01_01":
			scr_text("A chest of drawers");
		break;
		
		case "bed_01_need_key":
			scr_text("I should grab my car keys before heading out.");
		break;
	}
}