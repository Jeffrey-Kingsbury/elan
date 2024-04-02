
if(!_create_rain){
	_create_rain = true;
instance_destroy(obj_textbox);
create_textbox("pulled_over");
	instance_create_depth(0, 0, 1, obj_rain);
}
_fade_in_shader = true;