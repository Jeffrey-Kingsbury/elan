textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 122;
accept_key = input_check_pressed("accept") || input_check_pressed("interact");

//init
if(!setup) 
{
	setup = true;
	draw_set_font(fnt_dialog);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//Loop through the pages
	
	for(var p = 0; p < page_number; p++)
	{
		//find out how many chars are on each page of text in the text_length array
		text_length[p] = string_length(text[p]);
		
		//get the x pos for the textbox
			//This is when no character box is on screen (Centering the textbox)
			text_x_offset[p] = 44;
	}
}


if(audio[page] && !audio_is_playing(audio_props[page].sound)){
	audio_play_sound(audio_props[page].sound, audio_props[page].sound, audio_props[page].loop, audio_props[page].gain);
}


//typing the text out
if(draw_char < text_length[page])
{
	audio_play_sound(snd_text_typing_beep,2,false,0.1,0,random(1));
	draw_char += text_spd;
	draw_char = clamp(draw_char, 0, text_length[page]);
}

//control to flip through pages
if(accept_key)
{
	//if the typing is done
	if(draw_char == text_length[page])
	{
		//next page
		if(page < page_number - 1)
		{
			page++;
			draw_char = 0;
			
		//destroy text box
		}else{
			//link text for options
			if(option_number > 0)
			{
				create_textbox(option_link_id[option_pos]);
			}
			
			instance_destroy();
		}	
	}
	
	//if not done typing
	else{
		draw_char = text_length[page];
	
	}
}

//draw textbox
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;
txtb_img += txtb_img_spd;
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);

//back of textbox
draw_sprite_ext(txtb_spr, txtb_img, _txtb_x, _txtb_y, textbox_width / txtb_spr_w, textbox_height / txtb_spr_h, 0, c_white, .8);

//Options
if(draw_char == text_length[page] && page == page_number - 1)
{
	
	//option select
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos += keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
	option_pos = clamp(option_pos, 0, option_number -1);
	
	
	
	//draw options
	var _op_space = 20;
	var _op_border = 4;
	for (var op = 0; op < option_number; op++)
	{
		//draw option box
		var _o_w = string_width(option[op]) + _op_border * 2;
		draw_sprite_ext(txtb_spr, txtb_img, _txtb_x + 16, _txtb_y - _op_space * option_number + _op_space * op, _o_w / txtb_spr_w, (_op_space - 1) / txtb_spr_h, 0, c_white, 0.8);
		
		//draw option arrow
		if(option_pos == op)
		{
			draw_sprite(spr_opt_arrow, 0, _txtb_x, _txtb_y - _op_space * option_number + _op_space * op);
		}
		
		//draw option text
		draw_text(_txtb_x + 16 + _op_border, _txtb_y - _op_space * option_number + _op_space * op + 2, option[op]);
	}
}



//draw text
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(_txtb_x + border, _txtb_y + border, _drawtext, line_sep, line_width); 