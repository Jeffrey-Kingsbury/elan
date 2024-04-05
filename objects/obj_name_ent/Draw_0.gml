draw_self();
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_dialog);
draw_text(x, y, text);

draw_text(x, y - sprite_height * 1.5, "Enter your name");