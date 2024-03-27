draw_text_transformed( (((16 * 4) + 4) * 2) / 2,10, "Movement", 1.8, 1.8, 0);       

if(input_profile_get() == "keyboard_and_mouse"){

draw_sprite_ext(spr_controls_KB_D, -1, ((16 * 4) + 4) * 3, 150, 4, 4, 0, c_white, 1);
draw_sprite_ext(spr_controls_KB_S, -1, ((16 * 4) + 4) * 2, 150, 4, 4, 0, c_white, 1);
draw_sprite_ext(spr_controls_KB_A, -1, ((16 * 4) + 4), 150, 4, 4, 0, c_white, 1);
draw_sprite_ext(spr_controls_KB_W, -1, ((16 * 4) + 4) * 2, 80, 4, 4, 0, c_white, 1);
draw_sprite_ext(spr_controls_KB_SHIFT, -1, ((16 * 4) + 4) * 6, 80, 4, 4, 0, c_white, 1);
}

if(input_profile_get() == "gamepad"){
	
	draw_sprite_ext(spr_controls_XB_L3, -1, ((16 * 4) + 4) * 2, 80, 4, 4, 0, c_white, 1);
	draw_sprite_ext(input_verb_get_icon("run"), -1, ((16 * 4) + 4) * 6, 80, 4, 4, 0, c_white, 1);
}

draw_text_transformed( (((16 * 4) + 4) * 5.5), 10, "Run", 1.8, 1.8, 0); 
