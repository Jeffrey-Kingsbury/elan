if(!_touched){
	_touched = true;
	var _cop = instance_create_depth(230, 19134, 1, obj_police_down_animated);
	
		with(_cop){
			move_towards_point(230, 19534, 2);
		}
	
	var _siren_1 = instance_create_depth(265, 19149, 1, obj_siren_red);
		with(_siren_1){
			move_towards_point(265, 19534, 2);	
		}
		
	var _siren_2 = instance_create_depth(233, 19149, 1, obj_siren_blue);
		with(_siren_2){
			move_towards_point(233, 19534, 2);	
		}
	
} else {
	instance_destroy();
}