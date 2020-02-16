/// @description 

#region Time
/*
		|	Season 1 -- 30 days
		|	Season 2 -- 30 days
1 Year	|
		|	Season 3 -- 30 days
		|	Season 4 -- 30 days
*/

// Hour::Minute::Second
time_s = 0;
time_m = 0;
time_h = 0;

// Year::Season::Day
date_d = 0;
date_s = 0;
date_y = 0;

// seconds per step
INCREMENT_PAUSE = 0;
INCREMENT_REALTIME = 1 / room_speed;
INCREMENT_DEBUG = 1000;
time_increment = INCREMENT_REALTIME;

#endregion

#region Skybox 

// opacity : 0 <--> 1
skybox_darkness = 0;
skybox_draw = false;

// color
skybox_color = c_black;

// coords
skybox_width  = display_get_gui_width();
skybox_height = display_get_gui_height();

#endregion

