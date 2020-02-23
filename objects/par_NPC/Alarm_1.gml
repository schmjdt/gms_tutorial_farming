/// @description NPC Random Movement

// Cancel previous movement
moveX = 0;
moveY = 0;

if (can_move) {
	// Randomly choose idle or not
	var idle = choose(0, 1);

	if (idle == false) {
	 	var dir = choose(1, 2, 3, 4)
		switch(dir) {
			case 1: moveX = -spd; break; // left
			case 2: moveX =  spd; break; // right
			case 3: moveY = -spd; break; // up
			case 4: moveY =  spd; break; // down
		}
	}
}

// Randomly re-set this movement to loop
//alarm[1] = random_range(2.5, 4) * room_speed
alarm[1] = 1;