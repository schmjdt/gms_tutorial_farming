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
var increment_realtime = 1 / room_speed;
var increment_debug = 1000;
time_increment = increment_realtime;

#endregion

#region Skybox 

// opacity : 0 <--> 1
darkness = 0;

// color
light_color = c_black;

// coords
gui_widht  = display_get_gui_width();
gui_height = display_get_gui_height();

#endregion

