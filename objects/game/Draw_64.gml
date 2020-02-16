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
	
	#region Option 3
	with (day_cycle) {
		var lst = ds_list_create();
		ds_list_add(lst, string(time_h) + ":" + string(time_m) + ":" + string(time_s));
		ds_list_add(lst, string(date_y) + "/" + string(date_s) + "/" + string(date_d));
		draw_gui_text(lst, 10, 10, c_yellow);
	}
	
	with (obj_player) {
		var lst = ds_list_create();
		ds_list_add(lst, "Player Coord: " + string(x) + " x " + string(y));
		draw_gui_text(lst, 10, 80, c_blue);
	}
	#endregion
	
	#region Option 2
	//var ds_text = ds_grid_create(2, 3);
	
	//with (day_cycle) {
	//	ds_text[# 0, 0] = string(time_h) + ":" + string(time_m) + ":" + string(time_s);
	//	ds_text[# 1, 0] = c_yellow;
		
	//	ds_text[# 0, 1] = string(date_y) + "/" + string(date_s) + "/" + string(date_d);
	//	ds_text[# 1, 1] = c_yellow;
	//}
	
	//#region obj_player
	
	//with (obj_player) {
	//	ds_text[# 0, 2] = "Player Coord: " + string(x) + " x " + string(y);
	//	ds_text[# 1, 2] = c_yellow;
	//}
			
	//var yy = 0;
	//repeat (ds_grid_height(ds_text)) {
	//	c = ds_text[# 1, yy];
	//	draw_text_color(10, 10 + (20 * yy), ds_text[# 0, yy], c, c, c, c, 1);
	//	yy += 1;
	//}
	#endregion
		
	
	#region Option 1
	//#region	day_cycle

	//with (day_cycle) {
	//	var c = c_yellow;
	//	draw_text_color(10, 10, string(time_h) + ":" + string(time_m) + ":" + string(time_s), c, c, c, c, 1);
	//	draw_text_color(10, 30, string(date_y) + "/" + string(date_s) + "/" + string(date_d), c, c, c, c, 1);
	//}
	
	//#endregion

	//#region obj_player
	
	//with (obj_player) {
	//	var c = c_yellow;
	//	draw_text_color(10, 60, "Player Coord: " + string(x) + " x " + string(y), c, c, c, c, 1);
	//}
		
	//#endregion
	#endregion
}

#endregion