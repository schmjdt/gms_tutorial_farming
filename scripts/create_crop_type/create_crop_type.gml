/// @description create_crop_type
/// @arg growth_stage_duration
/// @arg cost

var arg_num = argument_count;

if (!ds_exists(ds_crops_types, ds_type_grid)) {
	ds_crops_types = ds_grid_create(arg_num, 1);
	var height = 1;
} else {
	var height = ds_grid_height(ds_crops_types);
	ds_grid_resize(ds_crops_types, arg_num, height + 1);
	height += 1;
}


var i = 0;
var yy = height - 1

repeat (arg_num) {
	ds_crops_types[# i,yy] = argument[i];
	i += 1;
}
