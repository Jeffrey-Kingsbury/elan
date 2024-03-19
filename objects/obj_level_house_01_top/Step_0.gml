player_x = inst_242D98C5.x;
player_y = inst_242D98C5.y;
opac_start = 294;
opac_end = 345;
opac_percentage = 1-(player_y - opac_start) / (opac_end - opac_start);

if(player_x >= 748 && player_x <= 810){
	if(player_y >= opac_start && player_y <= opac_end){
		inst_2EBBC1BA.image_alpha = clamp(opac_percentage, 0, 1)	
	}
}