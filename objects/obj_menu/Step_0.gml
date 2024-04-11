var up_key = input_check_pressed("up");
var down_key = input_check_pressed("down");
var left_key = input_check_pressed("left");
var right_key = input_check_pressed("right");
var left_key_held = input_check("left");
var right_key_held = input_check("right");
var interact_key = input_check_pressed("interact");
var back_key = input_check_pressed("pause");

if (back_key)
{
    if (global.pause)
    {
        if (page != 0)
        {
            page = 0;
            menu_option[page] = 0;
            audio_play_sound_on(global.sfx_emit, snd_menu_opt_selected_chime, false, 1, 1,0, 0.4);
        }
        else
        {
            audio_stop_sound(snd_intro_credit_menu);
            audio_resume_all();
            audio_play_sound_on(global.sfx_emit, snd_menu_opt_selected_chime, false, 1, 1, 0, 0.4);
            instance_activate_all();
            display_set_gui_maximize();
            page = 0;
            menu_option[page] = 0;
            global.pause = !global.pause;
        }
    }
    else
    {
        audio_pause_all();
        audio_play_sound_on(global.sfx_emit, snd_menu_opt_selected_chime, false, 1);
        audio_play_sound_on(global.music_emit,snd_intro_credit_menu, true, 1);
        instance_deactivate_all(true);
        instance_activate_object(input_controller_object);
        display_set_gui_size(global.view_width, global.view_height);
        global.pause = !global.pause;
    }
}

if (!global.pause)
{
    exit;
}


var ds_grid = menu_pages[page];
var ds_height = ds_grid_height(ds_grid);

if (inputting)
{
	
	    switch (ds_grid[# 1, menu_option[page]])
    {
        case _MENU_ELEMENT_TYPE.SHIFT:
		var hinput = right_key - left_key;
		if(hinput != 0){
				audio_play_sound_on(global.sfx_emit, snd_menu_opt_switch_chime, false, 1, 1, 0, 1.25);
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length(ds_grid[# 4, menu_option[page]]) - 1);
		}
		break;
        case _MENU_ELEMENT_TYPE.SLIDER:
				var hinput = right_key_held - left_key_held;
		if(hinput != 0){
				ds_grid[# 3, menu_option[page]] += hinput * 0.01;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
		}
		break;
        case _MENU_ELEMENT_TYPE.TOGGLE:
				var hinput = right_key - left_key;
		if(hinput != 0){
				audio_play_sound_on(global.sfx_emit, snd_menu_opt_switch_chime, false, 1, 1, 0, 1.25);
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
		}
		break;

    }
	
	}
else
{
    var ochange = down_key - up_key;
    if (ochange != 0)
    {
        audio_play_sound_on(global.sfx_emit, snd_menu_opt_switch_chime, false, 1);
        menu_option[page] += ochange;
        if (menu_option[page] > ds_height - 1)
        {
            menu_option[page] = 0;
        }
        if (menu_option[page] < 0)
        {
            menu_option[page] = ds_height - 1;
        }
    }
}
if (interact_key)
{
    audio_play_sound_on(global.sfx_emit, snd_menu_opt_selected_chime, false, 1);
    switch (ds_grid[# 1, menu_option[page]])
    {
        case _MENU_ELEMENT_TYPE.PAGE_TRANSFER:
            page = ds_grid[# 2, menu_option[page]];
        break;
		
        case _MENU_ELEMENT_TYPE.SCRIPT_RUNNER:
			script_execute(ds_grid[# 2, menu_option[page]]);
        break;
		
        case _MENU_ELEMENT_TYPE.SHIFT:
        case _MENU_ELEMENT_TYPE.SLIDER:
        case _MENU_ELEMENT_TYPE.TOGGLE: if(inputting){ script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]); }
            inputting = !inputting;
        break;
    }
}

