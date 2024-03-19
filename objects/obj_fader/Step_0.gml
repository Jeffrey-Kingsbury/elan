if(fader) {
	if(fade_dir = "out"){
		if(image_alpha > 0){
		image_alpha -= fade_speed;	
		} else {
			fader = false
		}
	}else{
		if(image_alpha < 1){
		image_alpha += fade_speed;	
		} else {
			fader = false
		}
	}
}

