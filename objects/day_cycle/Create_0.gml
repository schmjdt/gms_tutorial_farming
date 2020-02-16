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
date_d = 1;
date_s = 1;
date_y = 1;

// seconds per step
INCREMENT_PAUSE			= 0;
INCREMENT_REALTIME		= 1 / room_speed;
INCREMENT_HOUR_PER_SEC	= 60;
INCREMENT_MIN_PER_SEC	= 1;
INCREMENT_DEBUG			= 100;
time_increment = INCREMENT_REALTIME;

#endregion

#region Skybox 

// opacity : 0 <--> 1 alpha value
skybox_darkness = 0;
skybox_darkness_max = 0.7;
skybox_draw = false;

// color
skybox_color = c_black;

// coords
skybox_width  = display_get_gui_width();
skybox_height = display_get_gui_height();

#endregion

enum phase {
	sunrise = 6,
	day		= 8.5,
	sunset	= 18,
	night	= 22
}