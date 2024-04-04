rainlist = ds_list_create();
winddirection = random(180);
windspeed = 0; //Some arbitrary value. 100 is a lot of wind. 0 is none.
length = 4;
edge = 50; //How far outside of the view should we create drops
max_raindrops = 500;

var xx = camera_get_view_x(view_camera[0]);
var yy = camera_get_view_y(view_camera[0]);
var w = camera_get_view_width(view_camera[0]);
var h = camera_get_view_height(view_camera[0]);

//Fill up the list initally
while (ds_list_size(rainlist)/3 < max_raindrops) {
    ds_list_add(rainlist, xx-edge+random(w+edge*2)); //X
    ds_list_add(rainlist, yy-edge+random(h+edge*2)); //Y
    ds_list_add(rainlist, random(50));  //Random starting values
}