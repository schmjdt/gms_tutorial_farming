/// @description movement

if (!can_move) exit;

// INPUT -> INTENDED MOVEMENT -> (FUTURE) COLLISION CHECK -> APPLY MOVEMENT

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

// --- APPLY MOVEMENT
x += moveX;
y += moveY;
