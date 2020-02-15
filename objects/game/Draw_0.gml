/// @description 

if (!debug) exit;

#region Collision outlines

// Drawing boxes around all collisions
with (obj_collision) {
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true)
}

// Drawing box around the player
with (obj_player) {
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true)
}

#endregion

#region Other boxes

// Drawing boxes around all transitions
with (obj_transition) {
	draw_set_alpha(0.3);
	draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_teal, c_teal, c_teal, c_teal, false)
	draw_set_alpha(1);
}

#endregion

#region Grid

// Drawing the grid for placing crops
var cs = crops.cell_size;
var hr = room_height div cs;
var wr = room_width div cs;
var xx = 0;
var yy = 0;

draw_set_alpha(0.3);

repeat (wr) {
	draw_line_color(xx, 0, xx, room_height, c_white, c_white);
	xx += cs;
}

repeat (hr) {
	draw_line_color(0, yy, room_width, yy, c_white, c_white);
	yy += cs;
}

draw_set_alpha(1);

#endregion

