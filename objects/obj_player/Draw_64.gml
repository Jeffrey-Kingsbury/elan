var startX = 10;
var startY = 10;
var xSpacing = 64;
var ySpacing = 64;
var quantityOffsetX = 26;  // Adjust as needed for bottom right
var quantityOffsetY = 10;  // Adjust as needed for bottom right
var fontSize = 1;        // Adjust as needed for text size

for (var i = 0; i < array_length(global.player_inventory); i++) {
    // Draw the sprite
    draw_sprite(global.player_inventory[i].sprite, 1, startX, startY);

	draw_set_font(fnt_menu)
    // Draw the quantity
    draw_text_transformed(startX + quantityOffsetX, startY + quantityOffsetY, string(global.player_inventory[i].qty),
                          fontSize, fontSize, 0);  // 0 rotation

    startX += xSpacing;

    if (startX > 250) {
        startX = 10;
        startY += ySpacing;
    }
}


if(draw_exit_pooping){
	draw_sprite_ext(spr_controls_KB_SPACE, -1,  display_get_gui_width() / 2, display_get_gui_height() - sprite_height * 2, 4, 4, 0, c_white, 1);
}
