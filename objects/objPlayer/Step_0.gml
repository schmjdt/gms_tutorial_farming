/// @description movement

// INPUT -> INTENDED MOVEMENT -> (FUTURE) COLLISION CHECK -> APPLY MOVEMENT

// --- UPDATE INPUT
input_left	= keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_up	= keyboard_check(vk_up);
input_down	= keyboard_check(vk_down);

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
