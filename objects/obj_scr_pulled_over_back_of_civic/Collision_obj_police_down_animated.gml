if(instance_nearest(x, y, obj_police_down_animated).speed > 1){
	instance_nearest(x, y, obj_police_down_animated).speed -= 0.05;
}

if(instance_nearest(x, y, obj_siren_red).speed > 1){
	instance_nearest(x, y, obj_siren_red).speed -= 0.05;
}

if(instance_nearest(x, y, obj_siren_blue).speed > 1){
	instance_nearest(x, y, obj_siren_blue).speed -= 0.05;
}


if(instance_nearest(x, y, obj_police_down_animated).speed <= 1
&& instance_nearest(x, y, obj_siren_red).speed <= 1
&& instance_nearest(x, y, obj_siren_blue).speed <= 1){
	instance_destroy();	
}