// To be called from obj_crop

var first_growth = 0;
if (days_old > 0) first_growth = 1;
			
growth_stage = (days_old div growth_stage_duration) + first_growth;
		
if (growth_stage >= max_growth_stage) {
	growth_stage = max_growth_stage;
	fully_grown = true;
	alarm[1] = 1;
}