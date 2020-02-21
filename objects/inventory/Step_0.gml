/// @description 

if (!game.gui_inventory) exit;
		
var inv_grid = ds_inventory;
var width_grid = ds_grid_width(inv_grid);

var inst, ss_item, pp_item;
var xx, yy, nx, ny, sx, sy;

var in = -1;

#region Mouse Slot

moused_over_slot = -1;
		
gui_mouse_x = device_mouse_x_to_gui(0);
gui_mouse_y = device_mouse_y_to_gui(0);

var cell_buffer_x = (cell_size + inv_slots_buffer_x) * scale;
var cell_buffer_y = (cell_size + inv_slots_buffer_y) * scale;

var inv_mouse_x = gui_mouse_x - gui_slot_x;
var inv_mouse_y = gui_mouse_y - gui_slot_y;

var mouse_in_inventory = false;

if (inv_mouse_x > 0 and inv_mouse_x < gui_slot_x + (cell_size * scale) and
	inv_mouse_y > 0 and inv_mouse_y < gui_slot_y + (cell_size * scale)) {
	mouse_in_inventory = true;
	
	nx = inv_mouse_x div cell_buffer_x;
	ny = inv_mouse_y div cell_buffer_y;

	sx = inv_mouse_x - (nx * cell_buffer_x);
	sy = inv_mouse_y - (ny * cell_buffer_y);
	
	if (nx >= 0 and nx <= inv_slots_width and
		ny >= 0 and ny <= inv_slots_height and
	    sx < cell_size * scale and 
		sy < cell_size * scale) {
		mouse_slot_x = nx;
		mouse_slot_y = ny;
	
		var tmp_mos = mouse_slot_x + (mouse_slot_y * inv_slots_width);

		if (tmp_mos >= 0 and tmp_mos < inv_slots) {
			moused_over_slot = tmp_mos;
			if (moused_over_slot != moused_over_slot_last) {
				moused_over_slot_last = moused_over_slot;
				show_debug_message("Selected: " + string(moused_over_slot));
			}
		}
	}
} else {
	mouse_in_inventory = false
}

#endregion

#region Pickup Item

/*
	- You are moused over an inventory slot
	-	You have an item picked up
	-	You do not have an item picked up 
			and 
		The moused over slot contains an item
	- You are not moused over an inventory slot
	-	You have an item picked up
	-		You are not moused over the inventory
*/

if (moused_over_slot != -1) {
	ss_item = inv_grid[# 0, moused_over_slot];
	
	if (picked_slot != -1) {
		if (mouse_check_button_pressed(mb_left)) {
			if (ss_item == item.none) {
				#region Put Picked Up Item Into Empty Slot
				
				// Empty Slot - Drop
				xx = 0;
				repeat (width_grid) {
					inv_grid[# xx, moused_over_slot] = inv_grid[# xx, picked_slot];
					inv_grid[# xx, picked_slot] = 0;
					xx += 1;
				}
				
				picked_slot = -1;				
				
				#endregion
			} else if (ss_item == inv_grid[# 0, picked_slot]) {
				#region Stack Picked Up Item Into Moused OVer Slot Of Same Item
				
				// Contains Same Contents (but not same slot) - Stack
				if (moused_over_slot != picked_slot) {
					inv_grid[# 1, moused_over_slot] += inv_grid[# 1, picked_slot];
					
					xx = 0;
					repeat (width_grid) {
						inv_grid[# xx, picked_slot] = 0;
						xx += 1;
					}
				}
				
				picked_slot = -1;
				
				#endregion
			} else {
				#region Swap Picked Up Item With Moused Over Item
				
				// Contains Contents - Swap	
				xx = 0;
				repeat (width_grid) {
					var tmp = inv_grid[# xx, moused_over_slot]
					inv_grid[# xx, moused_over_slot] = inv_grid[# xx, picked_slot];
					inv_grid[# xx, picked_slot] = tmp;
					xx += 1;
				}
				
				// Choose whether to just swap and drop or swap and pickup
				//picked_slot = -1;		
				
				#endregion
			}
		}
	} else if (ss_item != item.none) {
		if (mouse_check_button_pressed(mb_middle)) {
			#region Drop Moused Over Item into Game World
			
			in = ss_item;
			inv_grid[# 1, moused_over_slot] -= 1;
			
			if (inv_grid[# 1, moused_over_slot] == 0) {
				inv_grid[# 0, moused_over_slot] = item.none;
			}
			
			// Create the item
			inst = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_item);
			with (inst) {
				item_num = ss_item;
				x_frame = item_num mod (spr_width / cell_size);
				y_frame = item_num div (spr_width / cell_size);
				show_debug_message("Dropped the item: " + string(item_num));
			}		
			
			create_notification = true;
			
			
			#endregion
		} else if (mouse_check_button_pressed(mb_right)) {
			#region Pickup Moused Over Item
			
			picked_slot = moused_over_slot;
			
			#endregion
		}
	}
} else {
	if (picked_slot != -1) {
		if (mouse_check_button_pressed(mb_left) and !mouse_in_inventory) {
			#region Drop Picked Up Item Into Game World
			
			pp_item = inv_grid[# 0, picked_slot];
			in = pp_item;
			inv_grid[# 1, picked_slot] -= 1;
			
			if (inv_grid[# 1, picked_slot] == 0) {
				inv_grid[# 0, picked_slot] = item.none;
				picked_slot = -1;
			}
			
			// Create the item
			inst = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_item);
			with (inst) {
				item_num = pp_item;
				x_frame = item_num mod (spr_width / cell_size);
				y_frame = item_num div (spr_width / cell_size);
				show_debug_message("Dropped the item: " + string(item_num));
			}		
			
			#endregion
		} else if (mouse_check_button_pressed(mb_right)) {
			#region Put Picked Up Item Back Into Original Slot
			
			picked_slot = -1;		
			
			#endregion
		}	
	}
}

#endregion

#region Create Notification

if (in != -1) {
	if (!instance_exists(obj_notification)) {
		instance_create_layer(0, 0, "Instances", obj_notification);	
	}
			
	with (obj_notification) {
		if (!ds_exists(ds_notifications, ds_type_grid)) {
			// Create Grid
			ds_notifications = ds_grid_create(2, 1);	
			var not_grid = ds_notifications;
			not_grid[# 0, 0] = -1;
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
					not_grid[# 0, yy] -= 1
					in_grid = true;
					break
				} 
							
				yy += 1;
			}
						
			if (!in_grid) {
				ds_grid_resize(not_grid, ds_grid_width(not_grid), grid_height + 1);	
				not_grid[# 0, grid_height] = -1;
				not_grid[# 1, grid_height] = name;
			}						
		}					
	}
}

#endregion