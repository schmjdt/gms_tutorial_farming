/// @description

#region Skybox

if (skybox_draw) {
	var c = skybox_color;

	draw_set_alpha(skybox_darkness);
	draw_rectangle_color(0, 0, skybox_width, skybox_height, c, c, c, c, false);
	draw_set_alpha(1);
}

#endregion
