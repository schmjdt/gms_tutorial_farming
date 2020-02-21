/// @description 

debug = false;
gui_vars = true;
pause_time = true;
pause_game = false;

gui_inventory = false;

global.game_width  = camera_get_view_width(view_camera[0]);
global.game_height = camera_get_view_height(view_camera[0]);

// Set the GUI size to be the same as game size
display_set_gui_size(global.game_width, global.game_height);

// Since the GUI Size is now the same, room scale will be 1
room_scale = 1;

// Since the GUI Size is now the same, could actually just use game_width/height instead of these
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

black_alpha = 0;

spawn_room = -1;
spawn_x = 0;
spawn_y = 0;
spawn_player_facing = -1;

do_transition = false;

// Directions - based on 'direction' and unit circle
enum dir {
	right = 0,
	up	  = 90,
	left  = 180,
	down  = 270,
}

// Comment this out if want to have repeatable-testing
randomize();

room_goto_next();

