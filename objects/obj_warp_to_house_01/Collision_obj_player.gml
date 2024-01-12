instance_create_depth(0,0, -9999, obj_fade);

array_push(obj_player.inventory, {label:"key", qty: 1, sprite: spr_item_key});

for(let x = 0; x < array_length(obj_player.inventory); x++){
draw_sprite(obj_player.inventory[x].sprite, 1, x_coord, y_coord);	
}
room_goto(Room1);
