global.player_name = "player";
global.visited_rooms = [];
global._player_x = 0;
global._player_y = 0;
global._player_room = "";
global._player_seen_news = [];
global._save_slot = 0;

//SETTINGS
global.music_vol = 1;
global.sfx_vol = 1;
global.master_vol = 1;
global.sfx_emit = audio_emitter_create();
global.music_emit = audio_emitter_create();
global.fullscreen = true;
global.resolution = 3;

	function set_player_face_to_idle(){
        if(obj_player.face == UP) {
            obj_player.face = IDLE_UP;
        } else if(obj_player.face == DOWN) {
            obj_player.face = IDLE_DOWN;
        } else if(obj_player.face == LEFT) {
            obj_player.face = IDLE_LEFT;
        } else if(obj_player.face == RIGHT) {
            obj_player.face = IDLE_RIGHT;
        }
}