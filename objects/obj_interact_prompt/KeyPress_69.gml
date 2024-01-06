if(instance_exists(obj_textbox)) exit;

with(obj_interactable)
{
	   if(collision_line(obj_player.x, obj_player.y, obj_player.x + lengthdir_x(100, obj_player.direction), obj_player.x + lengthdir_y(100, obj_player.direction), self, 1, 0))
    {
        create_textbox(text_id);
    }
}

// Inherit the parent event
event_inherited();

