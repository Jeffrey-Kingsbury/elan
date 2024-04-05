function scr_set_defaults_for_text(){
	line_break_pos[0, page_number] = 999;
	line_break_num[page_number] = 0;
	line_break_offset[page_number] = 0;
	
	txtb_spr[page_number] = spr_dialog_box_blu;
	speaker_sprite[page_number] = noone;
	speaker_side[page_number] = 1;
	moving_camera = false;
}

function scr_game_text(_text_id){

switch(_text_id){
	
	case "inventory_full":
		scr_text("You can't carry any more items.");
	break;
	
	case "bed_01_brother":
		scr_text("goo goo ga ga, bitch.");
	break;
	
	case "bed_01_dad":
		scr_text("Hey dad, I'm heading out.", "player");
		scr_text("You're going to hang out with P?", "dad", -1);
		scr_text("Alright, well. It's really coming down out there...", "dad-no", -1);
		scr_text("Better bring your galoshes, " + global.player_name, "dad-yes", -1);
	break;

	case "bed_01_1":
	inst_house_01_player.block_input = false;
	//audio_play_sound(snd_alarm_clock, 1, true)
	scr_text("huh, wha-?", "player");	
	scr_text("ughhh..", "player-no");
		scr_option("I'm up!", "bed_01_opt_01")		
		scr_option("Not yet!", "bed_01_opt_02")
	break;
	
		case "bed_01_opt_01":
			audio_stop_sound(snd_alarm_clock)
			audio_play_sound(snd_click, 1, false);
			inst_house_01_fader.fader = true;
			inst_upstairs_activate_menu._init = true;
		scr_text("*click*");
		scr_text("Shit. I must have dozed off...", "player");
		scr_text("I better get going.", "player-yes");
			instance_destroy(inst_house_01_speakblock_01);
		break;
		
		case "bed_01_opt_02":
		scr_text("BEEP BEEP BEEP BEEP...");
		scr_text("BEEP BEEP BEEP BEEP...");
			scr_option("I'm up!", "bed_01_opt_01")		
			scr_option("Not yet!", "bed_01_opt_02")
		break;
		
		
		/////////////////BOUGHT AND PAID FOR:
		
		//TAXI TO P
		
		case "bought_and_paid_for_taxi_0":
		scr_text("Sure is some weather we're having lately...", "taxi");
		scr_text("Feels like it hasn't stopped raining in weeks.", "taxi");
			scr_option("Remain silent", "bought_and_paid_for_taxi_01");
			scr_option("Yeah..", "bought_and_paid_for_taxi_02");
		break;
		
		case "bought_and_paid_for_taxi_01":
			scr_text("Not very talkative are you...", "taxi");
			scr_text("That's alright...", "taxi");
			break;
			
		case "bought_and_paid_for_taxi_02":
			scr_text("Mind if I ask what brings you to this part of town so late?", "taxi");
			break;
			
			
			//PULLED OVER
			
			case "pulled_over_chatting":
				scr_text("Dude can you believe it?!", "p", -1);
				scr_text("Were going to make so much fucking money!", "p", -1);
				scr_text("I still think it's risky as fuck.", "player");
				scr_text("You seriously need to chill dude. Relax for once.", "p", -1);
				scr_text("We have a literal pound of weed in the car and I'm high as fuck. I'm allowed to be stressed, dickhead.", "player");
				scr_text("Chill.", "p", -1);
			break;
			
			
			case "pulled_over":
				scr_text("Oh shit.", "p", -1);
				scr_text("Oh shit oh shit oh shit.", "p", -1);
				scr_text("That cop just pulled out behind us...", "p", -1);
				scr_text("P, I swear to god I'm going to kick your ass if we make it out of this.", "player");
				scr_text("Seriously. Chill. I got this.", "p", -1);
				scr_text("It's going to be fine.", "p", -1);
				scr_text("It's going to be fine.", "p", -1);
				scr_text("IT'S GOING TO BE FINE.", "p", -1);
				break;
				
			case "pulled_over_cop":
				scr_text("Hey there, where you boys headed?", "taxi");
				scr_text("Is there a problem officer?", "p");
				scr_text("Nope, no problem. I just need to see your license and registration.", "taxi");
				scr_text("Am I being detained?", "p");
				scr_text("Dude.", "player");
				scr_text("I.... Yeah.. Sorry, here you go.", "p", -1);
				scr_text("What's that smell boys?", "taxi");
				scr_text("What smell?", "player");
				scr_text("Why don't you both go ahead and step out of the car for me.", "taxi");

			break;
}
}

function scr_interactable_text(_text_id){
	switch(_text_id){
		
		case "bed_01_01":
			scr_text("A chest of drawers");
		break;
		
		
		
		case "house_01_downstairs_tv_01":
			scr_text("The body of seventeen year old Dawn Marie Birnbaum was discovered late last night in a snowbank off Interstate 80.", "news");		
			scr_text("Investigators say the victim was raped before being strangled to death.", "news");
			scr_text("Stay tuned for more updates as this case unfolds.", "news");
		break;
		
		case "house_01_downstairs_tv_02":
			scr_text("The body of seventeen year old Lorene Larhette was discovered after she had frozen to death along Joyce Howden.", "news");		
			scr_text("Lorene was a student at Northwest Outward Bound School for troubled teens.", "news");
			scr_text("Stay tuned for more updates as this case unfolds.", "news");
		break;
		
		case "house_01_downstairs_tv_03":
			scr_text("Police are investigating a wrongful death case at Forest Haven Asylum this evening.", "news");		
			scr_text("Witnesses say that seventeen year old Joy Evans choked to death after they were force fed while lying down.", "news");
			scr_text("Stay tuned for more updates as this case unfolds.", "news");
		break;
		
		case "house_01_downstairs_tv_04":
			scr_text("Tragedy tonight as firefighters work to put out the blaze that left two students dead at Grove School.", "news");		
			scr_text("We are getting confirmation that the victims names were Jonathan S. Lenoff and Peter Cooper.", "news");
			scr_text("Stay tuned for more updates as this case unfolds.", "news");
		break;
		
		case "house_01_downstairs_tv_05":
			scr_text("Fourteen year old Connie Munson was found dead in an apparent escape attempt from the Bethesda home for girls.", "news");		
			scr_text("Investigators agree that she was extremely troubled. Our thoughts and prayers to the family of Connie.", "news");
			scr_text("Next up, Sports.", "news");
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