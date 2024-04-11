// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_window_mode(){
switch(argument0){
	case 0: 
	window_set_fullscreen(true) 
	global.fullscreen = true;
	break;
	case 1:
	window_set_fullscreen(false)
	global.fullscreen = false;
	break;
}


	var _save_file_name = "settings.json";
	var _save = {
	"fullscreen": global.fullscreen
	}
	var _file = file_text_open_write(_save_file_name);
	file_text_write_string(_file, json_stringify(_save));
	file_text_close(_file);
  

}