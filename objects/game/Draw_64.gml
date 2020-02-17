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
	
	lst = [
		"room_width: " + string(room_width),
		"room_height: " + string(room_height),
		"view_wport[0]: " + string(view_wport[0]),
		"view_hport[0]: " + string(view_hport[0]),
		"camera_width: " + string(camera_get_view_width(view_camera[0])),
		"camera_height: " + string(camera_get_view_height(view_camera[0])),
		"room_scale: " + string(room_scale),
	];
	
	draw_gui_text(lst, 10, 120, c_yellow);
	
	with (inventory) {
		lst = [
			"gui_inv_width: " + string(gui_inv_width),
			"gui_inv_height: " + string(gui_inv_height),
			"gui_inv_x: " + string(gui_inv_x),
			"gui_inv_y: " + string(gui_inv_y),
			"gui_info_x: " + string(gui_info_x),
			"gui_info_y: " + string(gui_info_y),
			"gui_slot_x: " + string(gui_slot_x),
			"gui_slot_y: " + string(gui_slot_y)
		];
	}
	
	draw_gui_text(lst, 10, 260, c_yellow);
		
	var game_mouse_x = mouse_x;
	var game_mouse_y = mouse_y;
	var gui_mouse_x = device_mouse_x_to_gui(0);
	var gui_mouse_y = device_mouse_y_to_gui(0);
	
	lst = ["Game Mouse: " + string(game_mouse_x) + " x " + string(game_mouse_y),
	       "GUI  Mouse: " + string(gui_mouse_x)  + " x " + string(gui_mouse_y)];
	
	// Draw mouse pos
	draw_gui_text(lst, 10, room_height - 180, c_yellow);
	//draw_gui_text([lst[1]], gui_mouse_x, gui_mouse_y, c_black);
	
	with (obj_player) {
		lst = [
			"Player Coord: " + string(x) + " x " + string(y)
		];
	}
	
	// Draw obj_player text
	draw_gui_text(lst, 10, room_height - 20, c_yellow);
}

#endregion