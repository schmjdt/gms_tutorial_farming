if (instance_exists(obj_crop)) {
	with (obj_crop) {
		if (growth_stage < max_growth_stage) {
			days_old += 1;
			growth_stage = days_old div growth_stage_duration;
		} else {
			growth_stage = max_growth_stage;
			fully_grown = true;
			alarm[1] = 1;
		}
	}
}