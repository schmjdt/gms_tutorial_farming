if (instance_exists(obj_crop)) {
	with (obj_crop) {
		if (growth_stage < max_growth_stage) {
			days_old += 1;
			
			// First growth with jump to next stage
			var first_growth = 0;
			if (days_old > 0) first_growth = 1;
			
			growth_stage = (days_old div growth_stage_duration) + first_growth;
		} else {
			growth_stage = max_growth_stage;
			fully_grown = true;
			alarm[1] = 1;
		}
	}
}