if(_attacking){
	_attacking = false;
	
	if(face == ATTACK_RIGHT){
		face = RIGHT;	
	}
	
	if(face == ATTACK_LEFT){
		face = LEFT;	
	}
	
	if(face == ATTACK_UP){
		face = UP;	
	}
	
		if(face == ATTACK_DOWN){
		face = DOWN;	
	}
}
instance_destroy(obj_attack_collider);