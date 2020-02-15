/// @description 

if (ds_exists(ds_crops_types, ds_type_grid)) {
	ds_grid_destroy(ds_crops_types);
}

if (ds_exists(ds_crops_instances, ds_type_grid)) {
	ds_grid_destroy(ds_crops_instances);
}

if (ds_exists(ds_crops_data, ds_type_grid)) {
	ds_grid_destroy(ds_crops_data);
}