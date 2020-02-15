/// @description 

#region Crop Planting Icon
if (planting) {
	var i_grid = ds_crops_instances;
	var cs = cell_size;

	// Get closest grid position
	var gx = (mx div cs);
	var gy = (my div cs);

	xx = gx * cs;
	yy = gy * cs;

	// Check for planted crop
	var cell = i_grid[# gx, gy];

	// Check for soil
	var is_tile = has_tile("T_Soil", mx, my);

	var c = c_red;
	if (is_tile and cell == 0) {
		c = c_lime;
	}

	// Draw a rectangle for plantability
	draw_rectangle_color(xx, yy, xx + cs, yy + cs, c, c, c, c, true)

	// Get center of grid
	var cx = xx + (cs / 2);
	var cy = yy + (cs / 2);

	// Draw the crop to be planted
	draw_sprite(spr_crops_picked, select_crop, cx, cy);
}
#endregion