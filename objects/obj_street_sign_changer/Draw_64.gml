if(!_show_street){ exit };

var _x = display_get_gui_width() / 2;
var _y = display_get_gui_height() - 128;

draw_sprite_ext(spr_street_sign_bg, -1, _x, _y, 2, 1, 0, c_white, 1);

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_street_sign)

draw_text( _x, _y, _street);