/// @description instance_create_crop
/// @arg x
/// @arg y
/// @arg crop_type

var cs = crops.cell_size;

// Get closest grid position
var xx = (argument0 div cs);
var yy = (argument1 div cs);

xx = xx * cs;
yy = yy * cs;

// Get center of grid
var cx = xx + (cs / 2);
var cy = yy + (cs / 2);

// Create the instance
var inst = instance_create_layer(cx, cy, "Instances", obj_crop);

// Give the crop its characteristics
with (inst) {
	crop_type = argument2;
	growth_stage_duration = crops.ds_crops_types[# 0, crop_type];
}

return inst;