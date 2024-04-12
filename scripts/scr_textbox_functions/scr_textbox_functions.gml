/// @param text
/// @param [character]
/// @param [side]
/// @param [moving camera]
function scr_text(_text){
	scr_set_defaults_for_text();
	text[page_number] = _text;
	
	if(argument_count > 1){
		switch(argument[1]){
		
		case "player":
			speaker_sprite[page_number] = spr_player_portrait_speaking;
			txtb_spr[page_number] = spr_dialog_box_blu;
			speaker_name[page_number] = global.player_name;
		break;
		
		case "player-yes":
			speaker_sprite[page_number] = spr_player_portrait_yes;
			txtb_spr[page_number] = spr_dialog_box_blu;
			speaker_name[page_number] = global.player_name;
		break;
		
		case "player-no":
			speaker_sprite[page_number] = spr_player_portrait_no;
			txtb_spr[page_number] = spr_dialog_box_blu;
			speaker_name[page_number] = global.player_name;
		break;
		
		case "dad":
			speaker_sprite[page_number] = spr_dad_portrait_speaking;
			txtb_spr[page_number] = spr_dialog_box_brn;
			speaker_name[page_number] = "dad";
		break;
		
		case "dad-yes":
			speaker_sprite[page_number] = spr_dad_portrait_yes;
			txtb_spr[page_number] = spr_dialog_box_brn;
			speaker_name[page_number] = "dad";
		break;
		
		case "dad-no":
			speaker_sprite[page_number] = spr_dad_portrait_no;
			txtb_spr[page_number] = spr_dialog_box_brn;
			speaker_name[page_number] = "dad";
		break;
		
		case "mom-no":
			speaker_sprite[page_number] = spr_mom_portrait_no;
			txtb_spr[page_number] = spr_dialog_box_brn;
			speaker_name[page_number] = "mom";
			speaker_side[page_number] = -1;
		break;
		
		case "mom-yes":
			speaker_sprite[page_number] = spr_mom_portrait_yes;
			txtb_spr[page_number] = spr_dialog_box_brn;
			speaker_name[page_number] = "mom";
			speaker_side[page_number] = -1;
		break;
		
		case "mom":
			speaker_sprite[page_number] = spr_mom_portrait_speaking;
			txtb_spr[page_number] = spr_dialog_box_brn;
			speaker_name[page_number] = "mom";
			speaker_side[page_number] = -1;
		break;
		
		case "news":
			speaker_sprite[page_number] = spr_breaking_news;
			txtb_spr[page_number] = spr_dialog_box_red;
			speaker_side[page_number] = -1;
		break;
		
		case "taxi":
			speaker_sprite[page_number] = spr_dad_portrait_speaking;
			txtb_spr[page_number] = spr_dialog_box_yel;
			speaker_side[page_number] = -1;
			speaker_name[page_number] = "Taxi Driver";
		break;
		
		case "p":
			speaker_sprite[page_number] = spr_p_portrait_speaking;
			txtb_spr[page_number] = spr_dialog_box_grn;
			speaker_name[page_number] = "P";
			break;
		}	
	}
	
	
	if(argument_count > 2){
		speaker_side[page_number] = argument[2];
	}
	
	if(argument_count > 3){
		moving_camera = argument[3];	
	}
	page_number++;
}

/// @param option
/// @param link_id
function scr_option(_option, _link_id)
{
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	
	option_number++;
}

/// @param text_id
function create_textbox(_text_id, interactable = false)
{
	with(instance_create_depth(0,0,-9999, obj_textbox))
	{
		if(interactable){
				scr_interactable_text(_text_id);
		}
		else{
				scr_game_text(_text_id);
		}
	}
}