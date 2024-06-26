textbox_x = camera_get_view_x(view_camera[0]);
textbox_y = camera_get_view_y(view_camera[0]) + 122;
accept_key = input_check_pressed("accept") || input_check_pressed("interact") || input_check_pressed("back");
draw_set_font(fnt_dialog);

//init
if(!setup) 
{
	setup = true;
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//Loop through the pages
	for(var _p = 0; _p < page_number; _p++)
	{
		//find out how many chars are on each page of text in the text_length array
		text_length[_p] = string_length(text[_p]);
		
		
		//get the x pos for the textbox
		
		//char on left
		text_x_offset[_p] = 103;
		portrait_x_offset[_p] = 30;
		
		//char on right
		if(speaker_side[_p] == -1){
			text_x_offset[_p] = 30;
			portrait_x_offset[_p] = 269;
		}
		
		if(speaker_sprite[_p] == noone){
			//This is when no character box is on screen (Centering the textbox)
			text_x_offset[_p] = 66;	
		}
			
			
			//setting individual characters and finding where the lines of text should break
			for(var _c = 0; _c < text_length[_p]; _c++){
				//strings dont index at 0th, they index at 1st
				var _char_pos = _c + 1;
				
				//store individual characters in the char array
				char[_c, _p] = string_char_at(text[_p], _char_pos);
				
				//get current width of the line
				var _txt_up_to_char = string_copy(text[_p], 1, _char_pos);
				var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[_c, _p]);
				
				//get the last free space
				if(char[_c, _p] == " "){
					last_free_space = _char_pos + 1;
				}
				
				//get the line breaks
				if(_current_txt_w - line_break_offset[_p] > line_width){
					line_break_pos[line_break_num[_p], _p] = last_free_space;
					line_break_num[_p]++;
					var _txt_up_to_last_space = string_copy(text[_p], 1, last_free_space);
					var _last_free_space_string = string_char_at(text[_p], last_free_space);
					line_break_offset[_p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
				}
			}
			
			//getting each characters coordinates
			for(var _c = 0; _c < text_length[_p]; _c++){
				var _char_pos = _c + 1;	
				var _txt_x = textbox_x + text_x_offset[_p] + border;
				var _txt_y = textbox_y + border;
				//get current width of the line
				var _txt_up_to_char = string_copy(text[_p], 1, _char_pos);
				var _current_txt_w = string_width(_txt_up_to_char) - string_width(char[_c, _p]);
 				var _txt_line = 0;
				
				//compensate for string breaks
				for(var _lb = 0; _lb < line_break_num[_p]; _lb++){
						if(_char_pos >= line_break_pos[_lb, _p]){
							var _str_copy = string_copy(text[_p], line_break_pos[_lb, _p], _char_pos - line_break_pos[_lb, _p]);
							_current_txt_w = string_width(_str_copy);
							
							//record the line this char should be on
							_txt_line = _lb + 1; //no 0th index for chars
							
						}
				}
				
				char_x[_c,_p] = _txt_x + _current_txt_w;
				char_y[_c, _p] = _txt_y + _txt_line * line_sep;
		}
	}
}


//typing the text out
if(draw_char < text_length[page])
{
	audio_play_sound_on(global.sfx_emit, snd_text_typing_beep, false, 1, random(0.2),0, random(2));
	draw_char += text_spd;
	draw_char = clamp(draw_char, 0, text_length[page]);
}

if(draw_char == text_length[page]){
audio_stop_sound(snd_text_typing_beep)	
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
txtb_spr_w = sprite_get_width(txtb_spr[page]);
txtb_spr_h = sprite_get_height(txtb_spr[page]);

//draw the speaker
if(speaker_sprite[page] != noone){
	sprite_index = speaker_sprite[page];
	if(draw_char == text_length[page]){image_index = 0};
	var _speaker_x = textbox_x + portrait_x_offset[page];
	if(speaker_side[page] == -1){
		_speaker_x += sprite_width;
	}
	
	
	if(speaker_name[page] != noone){
		draw_sprite_ext(txtb_spr[page], txtb_img, textbox_x + portrait_x_offset[page], textbox_y + sprite_height + 2, sprite_width/txtb_spr_w, 1, 0, c_white, .8);
		draw_set_halign(fa_center);
		draw_text_ext_transformed(textbox_x + portrait_x_offset[page] +32,  textbox_y + 68.5, speaker_name[page],1.5,64,.75,.75,0)
		draw_set_halign(fa_left);
	}
	draw_sprite_ext(txtb_spr[page], txtb_img, textbox_x + portrait_x_offset[page], textbox_y, sprite_width/txtb_spr_w, sprite_height/txtb_spr_h, 0, c_white, .8);
	draw_sprite_ext(sprite_index, image_index, _speaker_x, textbox_y, speaker_side[page], 1, 0, c_white, 1);
	
}

//back of textbox
draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x, _txtb_y, textbox_width / txtb_spr_w, textbox_height / txtb_spr_h, 0, c_white, .8);
//Options
if(draw_char == text_length[page] && page == page_number - 1)
{
	
	//option select
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos += keyboard_check_pressed(ord("S")) - keyboard_check_pressed(ord("W"));
	option_pos = clamp(option_pos, 0, option_number -1);
	
	
	
	//draw options
	var _op_space = 20;
	var _op_border = 8;
	for (var op = 0; op < option_number; op++)
	{
		//draw option box
		var _o_w = string_width(option[op]) + _op_border * 2;
		draw_sprite_ext(txtb_spr[page], txtb_img, _txtb_x + 16, _txtb_y - _op_space * option_number + _op_space * op, _o_w / txtb_spr_w, (_op_space - 1) / txtb_spr_h, 0, c_white, 0.8);
		
		//draw option arrow
		if(option_pos == op)
		{
			draw_sprite(spr_opt_arrow, 0, _txtb_x, _txtb_y - _op_space * option_number + _op_space * op);
			draw_set_color(c_yellow);
			draw_text(_txtb_x + 16 + _op_border, _txtb_y - _op_space * option_number + _op_space * op + 2, option[op]);
		}else {
		
		//draw option text
		draw_set_color(c_white);
		draw_text(_txtb_x + 16 + _op_border, _txtb_y - _op_space * option_number + _op_space * op + 2, option[op]);
		}}
}

draw_set_color(c_white);



	// Effects
	

if(array_contains(moving_rooms, room)){ //hacky fix on moving textboxes. You lose text effects but thats the fix
var _draw_txt = string_copy(text[page], 1, draw_char)
draw_text_ext(_txtb_x + border, _txtb_y + border, _draw_txt, line_sep, line_width);

} else {
	

	
	
//draw text
for(var _c = 0; _c < draw_char; _c++){
	
	// wavy text
var _float_y = 0;

if(float_text[_c, page]){
float_dir[_c, page] -= 6;
_float_y = dsin(float_dir[_c, page]); 
}

// Shake text
var _shake_x = 0;
var _shake_y = 0;
if(shake_text[_c, page]){
	shake_timer[_c, page]--;
	if(shake_timer[_c, page] <=0){
		shake_timer[_c, page] = irandom_range(4, 8);
		shake_dir[_c, page] = irandom(360);
	}
	
		_shake_x = lengthdir_x(0.5, shake_dir[_c, page]);
	    _shake_y = lengthdir_y(0.5, shake_dir[_c, page]);
	
	
}

//Draw the text
	draw_text_color(char_x[_c, page] + _shake_x, char_y[_c, page] + _float_y + _shake_y, char[_c, page],col_1[_c, page], col_2[_c, page], col_3[_c, page], col_4[_c, page], 1);
}
}