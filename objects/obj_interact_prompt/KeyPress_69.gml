if(instance_exists(obj_textbox)) exit;

with(obj_interactable)
{
    var player_direction = obj_player.direction;
    var player_x = obj_player.x;
    var player_y = obj_player.y;
    var distance = 16;

    var end_x = player_x + lengthdir_x(distance, player_direction);
    var end_y = player_y + lengthdir_y(distance, player_direction);

    if(collision_line(player_x, player_y, end_x, end_y, self, 1, 0))
    {
        create_textbox(text_id, true);
    }
}


// Inherit the parent event
event_inherited();

