/// @description movement

// INPUT -> INTENDED MOVEMENT -> (FUTURE) COLLISION CHECK -> APPLY MOVEMENT

// --- UPDATE INPUT
input_left	= keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_up	= keyboard_check(vk_up);
input_down	= keyboard_check(vk_down);
input_slow  = keyboard_check(vk_control);
input_fast  = keyboard_check(vk_shift);

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

x += moveX;
y += moveY;
