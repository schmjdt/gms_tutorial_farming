/// @description 

if (drop_move) {
	x = lerp(x, goal_x, 0.1);
	y = lerp(y, goal_y, 0.1);
	
	if (abs(x - goal_x) < 1 and abs(y - goal_y) < 1) {
		drop_move = false;	
	}
} else {
	var px = obj_player.x;
	var py = obj_player.y;
	
	var r = detect_dst;	
	var d = point_in_rectangle(px, py, x - r, y - r, x + r, y + r);
	
	if (d) {
		// ARE WE ON TOP OF THE PLAYER?	
		r = pickup_dst;
		var d = point_in_rectangle(px, py, x - r, y - r, x + r, y + r);
		if (!d) {
			// Move towards the player for pickup
			x = lerp(x, px, 0.1);
			y = lerp(y, py, 0.1);
		} else {
			// Pickup
			
		}		
	}
	
}