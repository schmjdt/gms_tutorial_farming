/// @description character sprite layers

// up = 8
// left = 9
// down = 10
// right = 11

if (moveX < 0) {
	y_frame = 9;
} else if (moveX > 0) {
	y_frame = 11;
} else if (moveY < 0) {
	y_frame = 8;
} else if (moveY > 0) {
	y_frame = 10;
} else {
	x_frame = 0
}

// --- DRAW CHARACTER : BASE
draw_sprite_part(spr_base_male_1, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, x, y);

// --- DRAW CHARACTER : FEET
draw_sprite_part(spr_feet_male_boots_black, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, x, y);

// --- DRAW CHARACTER : LEGS
draw_sprite_part(spr_legs_male_pants_teal, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, x, y);

// --- DRAW CHARACTER : TORSO
draw_sprite_part(spr_torso_male_shirt_white, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, x, y);

// --- DRAW CHARACTER : HAIR
draw_sprite_part(spr_hair_male_messy_raven, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, x, y);


if (x_frame < anim_length - 1) {
	x_frame += anim_speed / anim_fps;	
} else {
	x_frame = 1;	
}

draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true)