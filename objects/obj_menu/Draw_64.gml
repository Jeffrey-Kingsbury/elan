if(!global.pause){ exit };

var gwidth = global.view_width;
var gheight = global.view_height;
var c = c_black;
var ds_grid = menu_pages[page];
var ds_height = ds_grid_height(ds_grid);
var y_buffer = 32;
var x_buffer = 16;
var start_y = (gheight/2) - ((((ds_height-1)/2) * y_buffer));
var start_x = gwidth/2;


///Draw pause background
draw_rectangle_color(0,0, gwidth, gheight, c, c, c, c, false);


//draw elements on left
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

var ltx = start_x - x_buffer;
var lty;
	var yy = 0;
			if(menu_pages[page] == ds_exit_prompt or menu_pages[page] == ds_load_prompt){
				draw_set_font(fnt_intro)
				draw_text_color(ltx, start_y - 64, "ARE YOU SURE?", c_white,c_white,c_white,c_white,1);	
			}
	repeat(ds_height){
		lty = start_y + (yy * y_buffer);
		draw_set_font(fnt_intro)
		
		c = c_white;
		xo = 0;
		
		if(yy == menu_option[page]){
			xo = -(x_buffer);
			c = c_orange;	
		}
		
		draw_text_color(ltx + xo, lty, ds_grid[# 0, yy],c,c,c,c,1);
		yy++;
	}

//draw dividing line
draw_line(start_x, start_y - y_buffer, start_x, lty + y_buffer);

//draw elements on right
draw_set_halign(fa_left);
var rtx = start_x + x_buffer;
var rty;

yy = 0;
repeat(ds_height){
	rty = start_y + (yy*y_buffer);
		switch(ds_grid[# 1, yy]){
		
		case _MENU_ELEMENT_TYPE.SHIFT:
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var left_shift = "<<";
			var right_shift = ">>";
			
			if(current_val == 0) left_shift = "";
			if(current_val == array_length(ds_grid[# 4, yy]) -1) right_shift = "";
			
			var c = c_white;
			if(inputting and yy == menu_option[page]){
					c = c_orange
			}
			
			draw_text_color(rtx, rty, left_shift + current_array[current_val] + right_shift, c, c, c, c, 1);
		break;
		
		
		case _MENU_ELEMENT_TYPE.SLIDER:
			var len = 128;
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[# 4, yy];
			var circle_pos = ((current_val - current_array[0]) / (current_array[1] - current_array[0]));
			var c = c_white;
						if(inputting and yy == menu_option[page]){
					c = c_orange
			}
			
			draw_line_width_color(rtx, rty, rtx + len, rty, 2, c, c);
			draw_circle_color(rtx + (circle_pos * len), rty, 4, c, c, false);
			draw_text_color(rtx + (len * 1.2), rty, string(floor(circle_pos * 100)) + "%", c, c, c, c, 1)
		break;
		
		
		case _MENU_ELEMENT_TYPE.TOGGLE:
		var current_val = ds_grid[# 3, yy];
			var c = c_white;
			var c1, c2;
			if(inputting and yy == menu_option[page]){
					c = c_orange
			}
			if(current_val == 0) { c1 = c; c2 = c_dkgray}
			else {c1 = c_dkgray; c2 = c};
			draw_text_color(rtx, rty, "ON", c1, c1, c1, c1, 1);
			draw_text_color(rtx + 64, rty, "OFF", c2, c2, c2, c2, 1);

		break;
	}
	yy++;
}


draw_set_valign(fa_top)
draw_set_font(fnt_default);