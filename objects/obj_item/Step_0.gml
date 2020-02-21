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
			
			// DESTROY ITEM WHEN PICKED UP
			if (picked_up) {
				#region Create Notification
				
				if (!instance_exists(obj_notification)) {
					instance_create_layer(0, 0, "Instances", obj_notification);	
				}
			
				var in = item_num;
				
				with (obj_notification) {
					if (!ds_exists(ds_notifications, ds_type_grid)) {
						// Create Grid
						ds_notifications = ds_grid_create(2, 1);	
						var not_grid = ds_notifications;
						not_grid[# 0, 0] = 1;
						not_grid[# 1, 0] = inventory.ds_items_desc[# 0, in];
					} else {
						// Add to Grid
						event_perform(ev_other, ev_user0);
						
						var not_grid = ds_notifications;
						var grid_height = ds_grid_height(not_grid);
						var name = inventory.ds_items_desc[# 0, in];
						var in_grid = false;
						// Check if item exists, if not resize grid, otherwise add to it
						
						var yy = 0;
						repeat (grid_height) {
							if (name == not_grid[# 1, yy]) {
								not_grid[# 0, yy] += 1
								in_grid = true;
								break
							} 
							
							yy += 1;
						}
						
						if (!in_grid) {
							ds_grid_resize(not_grid, ds_grid_width(not_grid), grid_height + 1);	
							not_grid[# 0, grid_height] = 1;
							not_grid[# 1, grid_height] = name;
						}						
					}					
				}
				
				#endregion
				
				instance_destroy();
				show_debug_message("Picked up item: " + string(in));
			}
		}		
	}	
}