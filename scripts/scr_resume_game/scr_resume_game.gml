function resume_game(){
            audio_stop_sound(snd_intro_credit_menu);
            audio_resume_all();
            audio_play_sound(snd_menu_opt_selected_chime, 1, false, 0.5, 0, 0.4);
            instance_activate_all();
            display_set_gui_maximize();
            page = 0;
            menu_option[page] = 0;
            global.pause = !global.pause;
        
}