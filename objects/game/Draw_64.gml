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

if (gui_vars or debug) {	
	var lst;
	
	with (day_cycle) {
		lst = [
			string(time_s),
			string(time_m),
			string(time_h),
			string(date_y) + " / " + string(date_s) + " / " + string(date_d)
		];
	}
	
	// Draw day_cycle text
	draw_gui_text(lst, 10, 10, c_yellow);
	
	with (obj_player) {
		lst = [
			"Player Coord: " + string(x) + " x " + string(y)
		];
	}
	
	// Draw obj_player text
	draw_gui_text(lst, 10, room_height - 20, c_yellow);
}

#endregion