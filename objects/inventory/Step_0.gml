/// @description 

if (!game.gui_inventory) exit;
		
#region Mouse Slot

moused_over_slot = -1;
		
gui_mouse_x = device_mouse_x_to_gui(0);
gui_mouse_y = device_mouse_y_to_gui(0);

var cell_buffer_x = (cell_size + inv_slots_buffer_x) * scale;
var cell_buffer_y = (cell_size + inv_slots_buffer_y) * scale;

var inv_mouse_x = gui_mouse_x - gui_slot_x;
var inv_mouse_y = gui_mouse_y - gui_slot_y;

if (inv_mouse_x > 0 and inv_mouse_x < gui_slot_x + (cell_size * scale) and
	inv_mouse_y > 0 and inv_mouse_y < gui_slot_y + (cell_size * scale)) {
	var nx = inv_mouse_x div cell_buffer_x;
	var ny = inv_mouse_y div cell_buffer_y;

	var sx = inv_mouse_x - (nx * cell_buffer_x);
	var sy = inv_mouse_y - (ny * cell_buffer_y);
	
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
}

#endregion


#region Pickup Item

if (moused_over_slot != -1) {
	var inv_grid = ds_inventory;
	var width_grid = ds_grid_width(inv_grid)

	var ss_item = inv_grid[# 0, moused_over_slot];
	
	if (picked_slot != -1) {
		if (mouse_check_button_pressed(mb_left)) {
			if (ss_item == item.none) {
				// Empty Slot - Drop
				var xx = 0;
				repeat (width_grid) {
					inv_grid[# xx, moused_over_slot] = inv_grid[# xx, picked_slot];
					inv_grid[# xx, picked_slot] = 0;
					xx += 1;
				}
				
				picked_slot = -1;				
			} else if (ss_item == inv_grid[# 0, picked_slot]) {
				// Contains Same Contents (but not same slot) - Stack
				if (moused_over_slot != picked_slot) {
					inv_grid[# 1, moused_over_slot] += inv_grid[# 1, picked_slot];
					
					var xx = 0;
					repeat (width_grid) {
						inv_grid[# xx, picked_slot] = 0;
						xx += 1;
					}
				}
				
				picked_slot = -1;
			} else {
				// Contains Contents - Swap	
				var xx = 0;
				repeat (width_grid) {
					var tmp = inv_grid[# xx, moused_over_slot]
					inv_grid[# xx, moused_over_slot] = inv_grid[# xx, picked_slot];
					inv_grid[# xx, picked_slot] = tmp;
					xx += 1;
				}
				
				//picked_slot = -1;		
			}
		}
	} else if (ss_item != item.none) {
		// Drop Item into Game World
		if (mouse_check_button_pressed(mb_middle)) {
			inv_grid[# 1, moused_over_slot] -= 1;
			
			if (inv_grid[# 1, moused_over_slot] == 0) {
				inv_grid[# 0, moused_over_slot] = item.none;
			}
			
			// Create the item
			var inst = instance_create_layer(obj_player.x, obj_player.y, "Instances", obj_item);
			with (inst) {
				item_num = ss_item;
				x_frame = item_num mod (spr_width / cell_size);
				y_frame = item_num div (spr_width / cell_size);
				show_debug_message("Dropped the item: " + string(item_num));
			}			
		}
		
		// Dropping Pickup Item into new Slot
		if (mouse_check_button_pressed(mb_right)) {
			picked_slot = moused_over_slot;		
		}
	}
} else {
	if (mouse_check_button_pressed(mb_right) and picked_slot != -1) {
		picked_slot = -1;		
	}	
}

#endregion