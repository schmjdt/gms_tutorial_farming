/// @description 

#region Time

time_increment = INCREMENT_HOUR_PER_SEC;
if (game.debug) time_increment = INCREMENT_DEBUG;
if (game.pause_time) time_increment = INCREMENT_PAUSE;

// Increment time
time_s += time_increment;
time_m = time_s / 60;
time_h = time_m / 60;

#endregion

#region Skybox

if (skybox_draw) {
	// Adjust the skybox alpha/color
	
	#region Phases and Variables
	
	var darks, colors, pstart, pend;
	
	if (time_h > phase.sunrise and time_h <= phase.day) {
		// Sunrise
		darks  = [skybox_darkness_max, 0.2];
		colors = [merge_color(c_black, c_navy, 0.3), c_orange];
		pstart = phase.sunrise;
		pend   = phase.day;
	} else if (time_h > phase.day and time_h <= phase.sunset) {
		// Day
		darks  = [0.2, 0, 0, 0, 0.2];
		colors = [c_orange, c_orange, c_white, c_orange, c_orange];
		pstart = phase.day;
		pend   = phase.sunset;
	} else if (time_h > phase.sunset and time_h <= phase.night) {
		// Sunset
		darks  = [0.2, skybox_darkness_max];
		colors = [c_orange, c_navy, merge_color(c_black, c_navy, 0.3)];
		pstart = phase.sunset;
		pend   = phase.night;
	} else {
		// Night
		darks  = [skybox_darkness_max];
		colors = [merge_color(c_black, c_navy, 0.3)];
		pstart = phase.night;
		pend   = phase.sunrise;
	}
	
	#endregion
	
	#region Alter Darkness and Colors Depending on Time
	
	// Add special case for night due to passing over 24 hours to 0
	if (pstart == phase.night) {
		skybox_color = colors[0];
		skybox_darkness = darks[0];
	} else {
		var rr = ((time_h - pstart) / (pend - pstart));
	
		// Colors
		var cc = rr * (array_length_1d(colors) - 1);
		var c1 = colors[floor(cc)];
		var c2 = colors[ceil(cc)];
	
		skybox_color = merge_color(c1, c2, cc - floor(cc));
	
		// Darkness
		var dd = rr * (array_length_1d(darks) - 1);
		var d1 = darks[floor(dd)];
		var d2 = darks[ceil(dd)];
	
		skybox_darkness = lerp(d1, d2, dd - floor(dd));
	}
	
	#endregion
}

#endregion

#region Cycle Check

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

#endregion