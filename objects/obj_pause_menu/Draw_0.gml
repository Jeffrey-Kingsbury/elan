// Draw the background
draw_sprite_ext(sprite_index, image_index, x, y, width / sprite_width, height / sprite_height, 0, c_white, 0.75);


// Draw options
draw_set_font(fnt_dialog);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for(var _i = 0; _i < op_length; _i++){
	var _c = c_white;
	
	if(pos == _i) {
		_c = c_yellow;
	}
	
	draw_text_color(x + op_border, y + op_border + op_space * _i, option[_i], _c,_c,_c,_c,1);	
}