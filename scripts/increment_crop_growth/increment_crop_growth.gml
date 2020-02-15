/// @description check_crop_growth
/// @arg days_increase

if (room == rm_farm) {
	if (instance_exists(obj_crop)) {
		with (obj_crop) {		
			days_old += argument0;
		
			check_crop_growth();
		}
	}
} else {
	// Increase the days_old of a crop within the grid
	
	var ds = crops.ds_crops_data;
	
	if (ds[# 0, 0] != -1) {
		var h = ds_grid_height(ds);
		var yy = 0;
		repeat (h) {
			ds[# 3, yy] += 1;
			yy += 1;	
		}
	}
}
