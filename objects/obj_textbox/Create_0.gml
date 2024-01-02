depth = -999;

textbox_width = 280;
textbox_height = 80;
border = 4;
line_sep = 12;
line_width = textbox_width - border * 2;
txtb_spr = spr_dialog_box;
txtb_img = 0;
txtb_img_spd = 4/60;

//the text
page = 0; 
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);

draw_char = 0;
text_spd = 1;

setup = false;