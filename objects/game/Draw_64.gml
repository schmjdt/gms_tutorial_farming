/// @description 

#region Transistion

if (do_transition) {
	// Handle Black Fade/Room Transition
	if (room != spawn_room) {
		black_alpha += 0.1;	
		if (black_alpha >= 1) {
			room_goto(spawn_room);		
		}
	} else {
		black_alpha -= 0.1;
		if (black_alpha <= 0) {
			do_transition = false;
		}
	}
	
	draw_set_alpha(black_alpha);
	draw_rectangle_color(0, 0, gui_width, gui_height, c_black, c_black, c_black, c_black, false);
	draw_set_alpha(1);	
}

#endregion

#region Debug


#endregion

#region Vars

if (vars or debug) {
	#region	day_cycle

	with (day_cycle) {
		var c = c_yellow;
		draw_text_color(10, 10, string(time_h) + ":" + string(time_m) + ":" + string(time_s), c, c, c, c, 1);
		draw_text_color(10, 30, string(date_y) + "/" + string(date_s) + "/" + string(date_d), c, c, c, c, 1);
	}
	
	#endregion

	#region obj_player
	
	with (obj_player) {
		var c = c_yellow;
		draw_text_color(10, 60, "Player Coord: " + string(x) + " x " + string(y), c, c, c, c, 1);
	}
		
	#endregion
}

#endregion