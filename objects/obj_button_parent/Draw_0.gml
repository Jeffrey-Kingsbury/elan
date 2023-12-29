draw_self();

draw_set_font(fnt_menu);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x, y, button_text);

//Always reset the values to default after you draw.
//Otherwise this can cause issues when creating multiple objects with different properties.
draw_set_halign(fa_left);
draw_set_valign(fa_top);