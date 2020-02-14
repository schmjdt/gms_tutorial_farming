/// @description Insert description here

frame_width  = 32;
frame_height = 64;

crop_type = 0;

days_old = 0;
growth_stage = 4; // TODO: temporary testable value
growth_stage_duration = 0;
max_growth_stage = (sprite_get_width(spr_crops) / frame_width) - 1

fully_grown = false;
sparkle = false;

// Adjust instance creation point. 
// Formula based upon sprite sheet pixel locations
xx = x - (frame_width / 2) + 2;
yy = y - (frame_height) + 6;
