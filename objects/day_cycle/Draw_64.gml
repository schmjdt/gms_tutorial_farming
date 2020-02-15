/// @description

#region Skybox

if (skybox_draw) {
	var c = skybox_color;

	draw_set_alpha(skybox_darkness);
	draw_rectangle_color(0, 0, skybox_width, skybox_height, c, c, c, c, false);
	draw_set_alpha(1);
}

#endregion

#region Vars

if (game.debug) {
	var c = c_yellow;
	draw_text_color(10, 10, string(time_h) + ":" + string(time_m) + ":" + string(time_s), c, c, c, c, 1);
	draw_text_color(10, 30, string(date_y) + "/" + string(date_s) + "/" + string(date_d), c, c, c, c, 1);
}

#endregion
