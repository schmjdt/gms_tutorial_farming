/// @description check_crop_growth
/// @arg days_increase

if (instance_exists(obj_crop)) {
	with (obj_crop) {		
		days_old += argument0;
		
		check_crop_growth();
	}
}
