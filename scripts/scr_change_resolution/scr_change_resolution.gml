// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_resolution(){
	global.resolution = argument0;
switch(argument0){
	case 0:
		window_set_size(1280,720);
	break;
	
	case 1: 
		window_set_size(1366,768);
	break;
	
	case 2:
		window_set_size(1600,900);
	break;
	
	case 3: 
		window_set_size(1920, 1080);
	break;
	
	case 4:
		window_set_size(2560,1440);
	break;
	
	case 5:
		window_set_size(3840,2160);
	break;
}

if(file_exists("settings.json")){
	var _file = file_text_open_read("settings.json");
	var _json = file_text_read_string(_file);
	var _data = json_parse(_json);
	_data.resolution = global.resolution;
	file_text_close(_file);
	_file = file_text_open_write("settings.json");
	file_text_write_string(_file, json_stringify(_data));
	file_text_close(_file);
  
}	

}