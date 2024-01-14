/// @param text(string)
function scr_text(_text, _audio = false, _audio_props = {sound: asset_sound, priority: 1, loop: false, gain: 1}){

	text[page_number] = _text;
	page_number++;
	audio[page_number] = _audio;	
	audio_props[page_number] = _audio_props;
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