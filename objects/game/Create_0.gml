/// @description Insert description here

debug = false;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

black_alpha = 0;

spawn_room = -1;
do_transition = false;

// Comment this out if want to have repeatable-testing
randomize();

room_goto_next();

