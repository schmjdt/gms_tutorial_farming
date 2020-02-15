/// @description player initialization

event_inherited();

// Character Movement

spd_slow = 1;
spd_norm = 2;
spd_fast = 3;

//spd = spd_norm;

facing = -1;

// Character Sprites

anim_length = 9;
anim_speed = 12;
anim_fps = 60;
frame_size = 64;

x_frame = 1;
y_frame = 10;

x_offset = sprite_get_xoffset(mask_index)
y_offset = sprite_get_yoffset(mask_index)

spr_shadow  = spr_character_shadow

// TODO: Add shaders for even more color choices
spr_base	= spr_base_male_1
spr_feet	= spr_feet_male_boots_black
spr_torso	= spr_torso_male_shirt_white
spr_legs	= spr_legs_male_pants_teal
spr_hair	= spr_hair_male_messy_raven
