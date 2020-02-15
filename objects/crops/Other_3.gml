/// @description 

// Only destroy crop types at end of game so only created once
if (ds_exists(ds_crops_types, ds_type_grid)) {
	ds_grid_destroy(ds_crops_types);
}