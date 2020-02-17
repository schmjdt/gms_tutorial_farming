/// @description 

if (drop_move) {
	x = lerp(x, goal_x, 0.1);
	y = lerp(y, goal_y, 0.1);
	
	if (abs(x - goal_x) < 1 and abs(y - goal_y) < 1) {
		drop_move = false;	
	}
} else {
	// TODO: Move this to game obj and have it only needed to be pressed once
	if (!keyboard_check(ord("E"))) exit;
	
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
			var in = item_num;
			
			with (inventory) {
				var ds_inv = ds_inventory;
				var picked_up = false;
				
				// Check if item exists in inventory already
				var yy = 0;
				repeat (inv_slots) {
					if (ds_inv[# 0, yy] == in) {
						ds_inv[# 1, yy] += 1;
						picked_up = true;
						break;
					}
					
					yy += 1;	
				}
				
				// Add item to an empty slot, if there is one
				if (!picked_up) {
					var yy = 0;
					repeat (inv_slots) {
						if (ds_inv[# 0, yy] == item.none) {
							ds_inv[# 0, yy] = in;
							ds_inv[# 1, yy] = 1;
							picked_up = true;
							break;
						}
					
						yy += 1;	
					}						
				}
			}
			
			// DESTROY ITEM IF PICKED UP
			if (picked_up) {
				instance_destroy();
				show_debug_message("Picked up item: " + string(in));
			}
		}		
	}
	
}