var _start_x = 10;
var _start_y = 10;
var _x_spacing = 64;
var _y_spacing = 64;
var _qty_offset_x = 26;  // Adjust as needed for bottom right
var _qty_offset_y = 10;  // Adjust as needed for bottom right
var _font_size = 1;        // Adjust as needed for text size

for (var _i = 0; _i < array_length(global.player_inventory); _i++) {
    // Draw the sprite
    draw_sprite(global.player_inventory[_i].sprite, 1, _start_x, _start_y);

	draw_set_font(fnt_menu)
    // Draw the quantity
    draw_text_transformed(_start_x +_qty_offset_x, _start_y + _qty_offset_y, string(global.player_inventory[_i].qty),
                          _font_size, _font_size, 0);  // 0 rotation

    _start_x += _x_spacing;

    if (_start_x > 250) {
        _start_x = 10;
        _start_y += _y_spacing;
    }
}


if(draw_exit_pooping){
	draw_sprite_ext(spr_controls_KB_SPACE, -1,  display_get_gui_width() / 2, display_get_gui_height() - sprite_height * 2, 4, 4, 0, c_white, 1);
}
