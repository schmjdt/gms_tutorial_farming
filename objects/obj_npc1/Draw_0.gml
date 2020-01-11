/// @description character sprite layers

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

var xx = x - x_offset;
var yy = y - y_offset;

// --- INCREMENT FRAME FOR ANIMATION
if (x_frame  + (anim_speed / anim_fps) < anim_length) {
	x_frame += anim_speed / anim_fps;
} else {
	x_frame = 1;	
}

// --- DRAW CHARACTER : BASE
draw_sprite_part(spr_base, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

// --- DRAW CHARACTER : FEET
draw_sprite_part(spr_feet, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

// --- DRAW CHARACTER : LEGS
draw_sprite_part(spr_legs, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

// --- DRAW CHARACTER : TORSO
draw_sprite_part(spr_torso, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);

// --- DRAW CHARACTER : HAIR  
draw_sprite_part(spr_hair, 0, floor(x_frame) * frame_size, y_frame * frame_size, frame_size, frame_size, xx, yy);


draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_yellow, c_yellow, c_yellow, c_yellow, true)