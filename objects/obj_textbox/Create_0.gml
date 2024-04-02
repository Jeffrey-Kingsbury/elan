depth = -999;
 _text_audio_count = 0;
 _scale = 4;
textbox_base_width = 232;
textbox_base_height = 64;
// Calculate the scaled width and height based on the camera's scale
portrait_base_width = 64; // Adjust this value according to your portrait width
textbox_width = textbox_base_width * camera_get_view_width(view_camera[0]) / 368;
textbox_height = textbox_base_height * camera_get_view_height(view_camera[0]) / 207;
textbox_width = 232;
textbox_height = 64;
border = 5;
spacing = 5;
line_sep = 12;
line_width = textbox_width - border * 2.5;
txtb_spr[0] = spr_dialog_box_blu;
txtb_img = 0;
txtb_img_spd = 6/60;

moving_rooms[0] = rm_taxi_to_p;
moving_rooms[1] = rm_pulled_over;

//the text
page = 0; 
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);
char[0,0] = "";
char_x[0,0] = 0;
char_y[0,0] = 0;

draw_char = 0;
text_spd = 1;

//options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;
_moving_camera = false;

setup = false;

//effects
scr_set_defaults_for_text();
last_free_space = 0;