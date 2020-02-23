/// @description movement

// INPUT -> INTENDED MOVEMENT -> (FUTURE) COLLISION CHECK -> APPLY MOVEMENT

// --- UPDATE INPUT
input_left	= keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_up	= keyboard_check(vk_up);
input_down	= keyboard_check(vk_down);
input_slow  = keyboard_check(vk_control);
input_fast  = keyboard_check(vk_shift);
input_interact = keyboard_check_pressed(ord("E"));

// --- ALTER SPEED
if (input_slow or input_fast) {
	spd = abs((input_slow * spd_slow) - (input_fast * spd_fast));
} else {
	spd = spd_norm;	
}

// --- RESET MOVE VARIABLES
moveX = 0;
moveY = 0;

// --- INTENDED MOVEMENT
moveX = (input_right - input_left) * spd;
// Remove diagonol movement
if (moveX == 0) {
	// Biased towards left/right
	moveY = (input_down - input_up) * spd;
}

// --- GET FACING
if (moveX != 0) {
	switch(sign(moveX)) {
		case 1: facing = dir.right; break;
		case -1: facing = dir.left; break;
	}
} else if (moveY != 0) {
	switch(sign(moveY)) {
		case 1: facing = dir.down; break;
		case -1: facing = dir.up; break;
	}
} else {
	facing = -1;
}

// --- COLLISION CHECK
// -   HORIZONTAL
if (moveX != 0) {
	var collisionH = instance_place(x + moveX, y, obj_collision);
	if (collisionH != noone and collisionH.collidable) {
		repeat(abs(moveX)) {
			if (!place_meeting(x + sign(moveX), y, obj_collision)) {
				x += sign(moveX);
			} else {
				break;
			}
		}
		// Since manually moved above, set speed to 0
		moveX = 0;	
	}
}

// -   VERTICAL
if (moveY != 0) {
	var collisionV = instance_place(x, y + moveY, obj_collision);
	if (collisionV != noone and collisionV.collidable) {
		repeat(abs(moveY)) {
			if (!place_meeting(x, y + sign(moveY), obj_collision)) {
				y += sign(moveY);
			} else {
				break;
			}
		}
		// Since manually moved above, set speed to 0
		moveY = 0;	
	}
}

// -    OBJECTS
var inst = instance_place(x, y, obj_transition);
if (inst != noone and facing == inst.player_facing_before) {
	with (game) {
		if (! do_transition) {
			spawn_room = inst.target_room;
			spawn_x = inst.target_x;
			spawn_y = inst.target_y;
			spawn_player_facing = inst.player_facing_after;
			do_transition = true;
		}
	}
}

// -	TEXTBOX
if (input_interact) {
	if (active_textbox == noone) {
		var _radius = 16;
	
		// TODO: make it so the collision rectangle is only in front of player and rotates around
		var _inst = collision_rectangle(x - _radius, y - _radius, x + _radius, y + _radius, par_npc, false, true);
	
		if (_inst != noone) {
			with (_inst) {
				var _tbox = create_textbox(text, speakers);
				can_move = false;
				moveX = 0;
				moveY = 0;
			}
		
			active_textbox = _tbox;
		}
	} else {
		if (!instance_exists(active_textbox)) {
			active_textbox = noone;
		}
	}
}

// --- APPLY MOVEMENT
x += moveX;
y += moveY;
