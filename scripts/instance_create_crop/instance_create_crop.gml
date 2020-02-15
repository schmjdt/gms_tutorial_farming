/// @description instance_create_crop
/// @arg x
/// @arg y
/// @arg crop_type

var i_grid = crops.ds_crops_instances;
var cs = crops.cell_size;

// Get closest grid position
var gx = (argument0 div cs);
var gy = (argument1 div cs);

var cell = i_grid[# gx, gy];

if (cell != 0) {
	show_debug_message("There is already something planted.");
	return false;
}

xx = gx * cs;
yy = gy * cs;

// Check for soil
var is_tile = has_tile("T_Soil", argument0, argument1);

if (!is_tile) {
	show_debug_message("There is no soil here.");
	return false;
}

// Get center of grid
var cx = xx + (cs / 2);
var cy = yy + (cs / 2);

// Create the instance
var inst = instance_create_layer(cx, cy, "Instances", obj_crop);
i_grid[# gx, gy] = inst;

// Give the crop its characteristics
with (inst) {
	crop_type = argument2;
	growth_stage_duration = crops.ds_crops_types[# 0, crop_type];
}

return inst;