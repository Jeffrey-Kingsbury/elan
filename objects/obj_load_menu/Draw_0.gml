
var _new_w = 0;
for(var _i = 0; _i < op_length; _i++){
var _op_w = string_width(string(option[_i].save_slot)) + 64;
_new_w = max(_new_w, _op_w);
}

width = _new_w + op_border * 4;
height = op_border * 2 + string_height(option[0]) + (op_length -1) * op_space;

x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - width / 2
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2 - height / 2
// Draw the background
draw_sprite_ext(spr_black_solid, image_index, 0, 0, 10000, 10000, 0, c_white, 0.75);
draw_sprite_ext(sprite_index, image_index, x, y, width / sprite_width, height / sprite_height, 0, c_white, 0.75);


// Draw options
draw_set_font(fnt_dialog);
draw_set_valign(fa_top);
draw_set_halign(fa_left);


for(var _i = 0; _i < op_length; _i++){
	var _c = c_white;
	var _c_d = c_gray
	
	if(pos == _i) {
		_c = c_yellow;
		_c_d = c_yellow;
	}
	
	draw_text_color(x + op_border, y + op_border + op_space * _i, "Save " + string(option[_i].save_slot) + " - " + option[_i].player_name, _c,_c,_c,_c, 1);	
	
}
