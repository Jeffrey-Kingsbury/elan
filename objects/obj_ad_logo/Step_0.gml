
if(_fade){
image_alpha -= fade_speed;


if(image_alpha <= 0)
{
room_goto(rm_menu);
instance_destroy();
}
}