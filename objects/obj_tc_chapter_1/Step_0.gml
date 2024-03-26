if(!_triggered) { exit };

if(image_alpha < 1){
	image_alpha += 0.006;
}

move_towards_point(288, 20000, 1)
alarm[0] = 6000;