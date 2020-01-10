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
if(input_left) {
	moveX = -spd;
}

if(input_right) {
	moveX = spd;
}

if(input_up) {
	moveY = -spd;
}

if(input_down) {
	moveY = spd;
}

x += moveX;
y += moveY;
