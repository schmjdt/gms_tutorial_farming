/// @description 

time_increment = INCREMENT_REALTIME;
if (game.debug) time_increment = INCREMENT_DEBUG;
if (game.pause_time) time_increment = INCREMENT_PAUSE;

// Increment time
time_s += time_increment;
time_m = time_s / 60;
time_h = time_m / 60;

skybox_darkness = time_h / 24;

// Cycle Check
if (time_h >= 24) {
	time_s = 0;
	date_d += 1;
	
	increment_crop_growth(1);
	
	if (date_d > 30) {
		date_d = 1;
		date_s += 1;
		if (date_s > 4) {
			date_s = 1;
			date_y += 1;
		}
	}
}