// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_game_text(_text_id){

switch(_text_id){
	
	case "inventory_full":
		scr_text("You can't carry any more items.");
	break;
	
	case "bed_01_brother":
		scr_text("goo goo ga ga, bitch.");
	break;
	
	case "bed_01_dad":
		scr_text("Ask your mother.");
	break;

	case "bed_01_1":
	inst_house_01_player.block_input = false;
	scr_text("huh, wha-?", true, {sound: snd_alarm_clock, loop: false, gain: 1});	
	scr_text("ughhh..");
		scr_option("I'm up!", "bed_01_opt_01")		
		scr_option("Not yet!", "bed_01_opt_02")
	break;
	
		case "bed_01_opt_01":
			audio_stop_sound(snd_alarm_clock)
			audio_play_sound(snd_click, 1, false);
			inst_house_01_fader.fader = true;
			inst_upstairs_activate_menu._init = true;
		scr_text("*click*");
		scr_text("Shit. I must have dozed off...");
		scr_text("I better get going.");
			instance_destroy(inst_house_01_speakblock_01);
		break;
		
		case "bed_01_opt_02":
		scr_text("BEEP BEEP BEEP BEEP...");
		scr_text("BEEP BEEP BEEP BEEP...");
			scr_option("I'm up!", "bed_01_opt_01")		
			scr_option("Not yet!", "bed_01_opt_02")
		break;
		
		
		case "bought_and_paid_for_taxi_0":
		scr_text("Sure is some weather we're having lately...");
		scr_text("Feels like it hasn't stopped raining in weeks.");
			scr_option("Remain silent", "bought_and_paid_for_taxi_01");
			scr_option("Yeah..", "bought_and_paid_for_taxi_02");
		break;
		
		case "bought_and_paid_for_taxi_01":
			scr_text("Not very talkative are you...");
			scr_text("That's alright...");
			break;
			
		case "bought_and_paid_for_taxi_02":
			scr_text("Mind if I ask what brings you to this part of town so late?");
			break;
}
}

function scr_interactable_text(_text_id){
	switch(_text_id){
		
		case "bed_01_01":
			scr_text("A chest of drawers");
		break;
		
		
		
		case "house_01_downstairs_tv_01":
			scr_text("The body of seventeen year old Dawn Marie Birnbaum was discovered late last night in a snowbank off Interstate 80. Investigators say the victim was raped before being strangled to death.");		
			scr_text("Stay tuned for more updates as this case unfolds.");
		break;
		
		case "house_01_downstairs_tv_02":
			scr_text("The body of seventeen year old Lorene Larhette was discovered after she had frozen to death along Joyce Howden.");		
			scr_text("Lorene was a student at Northwest Outward Bound School for troubled teens.");
			scr_text("Stay tuned for more updates as this case unfolds.");
		break;
		
		case "house_01_downstairs_tv_03":
			scr_text("Police are investigating a wrongful death case at Forest Haven Asylum this evening.");		
			scr_text("Witnesses say that seventeen year old Joy Evans choked to death after they were force fed while lying down.");
			scr_text("Stay tuned for more updates as this case unfolds.");
		break;
		
		case "house_01_downstairs_tv_04":
			scr_text("Tragedy tonight as firefighters work to put out the blaze that left two students dead at Grove School.");		
			scr_text("We are getting confirmation that the victims names were Jonathan S. Lenoff and Peter Cooper.");
			scr_text("Stay tuned for more updates as this case unfolds.");
		break;
		
		case "house_01_downstairs_tv_05":
			scr_text("Fourteen year old Connie Munson was found dead in an apparent escape attempt from the Bethesda home for girls.");		
			scr_text("Investigators agree that she was extremely troubled. Our thoughts and prayers to the family of Connie.");
			scr_text("Next up, Sports.");
		break;






			
		case "bed_01_need_key":
			scr_text("I should grab my car keys before heading out.");
		break;
		
		case "house_01_get_key":
			global.add_to_inventory("key_bed_01", "key", 1, spr_item_key);
			inst_house_01_keys_prompt.is_visible = false;
			scr_text("You found your keys");
		break;
	}
}