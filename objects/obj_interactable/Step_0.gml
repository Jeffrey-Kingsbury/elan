with(obj_interactable)
{
	if(input_check("interact") == 1){
	   if(collision_line(obj_player.x, obj_player.y, obj_player.x + lengthdir_x(100, obj_player.direction), obj_player.x + lengthdir_y(100, obj_player.direction), self, 0, 0))
    {
        show_debug_message("interacted")
    }
}
}