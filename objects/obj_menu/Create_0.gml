global.pause = false;
global.view_width = camera_get_view_width(view_camera[1]);
global.view_height = camera_get_view_height(view_camera[1]);



enum _MENU_PAGE {
	_MAIN,
	_SETTINGS,
	_EXIT_PROMPT,
	_LOAD_PROMPT,
}

enum _MENU_ELEMENT_TYPE {
	SCRIPT_RUNNER,
	PAGE_TRANSFER,
	SLIDER,
	SHIFT,
	TOGGLE
}

ds_menu_main = create_menu_page(
["RESUME", _MENU_ELEMENT_TYPE.SCRIPT_RUNNER, resume_game],
["SETTINGS", _MENU_ELEMENT_TYPE.PAGE_TRANSFER, _MENU_PAGE._SETTINGS],
["SAVE", _MENU_ELEMENT_TYPE.SCRIPT_RUNNER, save_game],
["LOAD", _MENU_ELEMENT_TYPE.PAGE_TRANSFER, _MENU_PAGE._LOAD_PROMPT],
["EXIT", _MENU_ELEMENT_TYPE.PAGE_TRANSFER, _MENU_PAGE._EXIT_PROMPT],
);

ds_settings = create_menu_page(
["MUSIC VOLUME", _MENU_ELEMENT_TYPE.SLIDER, change_music_volue, global.music_vol, [0,1]],
["SFX VOLUME", _MENU_ELEMENT_TYPE.SLIDER, change_sfx_volume, global.sfx_vol, [0,1]],
["RESOLUTION", _MENU_ELEMENT_TYPE.SHIFT, change_resolution, 3, ["1280x720", "1366x768", "1600x900", "1920x1080", "2560x1440", "3840x2160"]],
["FULLSCREEN", _MENU_ELEMENT_TYPE.TOGGLE, change_window_mode, 0, ["FULLSCREEN", "WINDOWED"]],
["BACK", _MENU_ELEMENT_TYPE.PAGE_TRANSFER, _MENU_PAGE._MAIN]
)

ds_exit_prompt = create_menu_page(
["YES", _MENU_ELEMENT_TYPE.SCRIPT_RUNNER, exit_game],
["NO", _MENU_ELEMENT_TYPE.PAGE_TRANSFER, _MENU_PAGE._MAIN]
)

ds_load_prompt = create_menu_page(
["YES", _MENU_ELEMENT_TYPE.SCRIPT_RUNNER, load_game],
["NO", _MENU_ELEMENT_TYPE.PAGE_TRANSFER, _MENU_PAGE._MAIN]
)


page = 0;
menu_pages = [ds_menu_main, ds_settings, ds_exit_prompt, ds_load_prompt];

var i = 0;
var array_len = array_length(menu_pages);

repeat(array_len){
	menu_option[i] = 0;
	i++;
}

inputting = false;
