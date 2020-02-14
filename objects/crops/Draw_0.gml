/// @description 

if (!planting) {
	exit;
}

var cs = cell_size;
// Get closest grid position
var xx = (mx div cs);
var yy = (my div cs);

xx = xx * cs;
yy = yy * cs;

// Get center of grid
var cx = xx + (cs / 2);
var cy = yy + (cs / 2);

// Draw the crop to be planted
draw_sprite(spr_crops_picked, select_crop, cx, cy);
