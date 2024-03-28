if(fader) {
	if(fade_dir = "out"){
		if(image_alpha > 0){
		image_alpha -= fade_speed;	
		} else {
			fader = false
			if(destroy){
			instance_destroy();
			}
		}
	}else{
		if(image_alpha < 1){
		image_alpha += fade_speed;	
		} else {
			fader = false
		}
	}
}

