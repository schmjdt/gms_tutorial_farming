/// @description 

if (!game.gui_inventory) exit;

var info_grid = ds_player_info;
var desc_grid = ds_items_desc;
var inv_grid = ds_inventory;

var c, ci, ii, ix, iy, xx, yy, ci, sx, sy, num;
ii = 0; ix = 0; iy = 0;


#region Inventory GUI

draw_sprite_part_ext(
	spr_inv_UI, 0, 
	cell_size, 0, 
	gui_inv_width, gui_inv_height, 
	gui_inv_x, gui_inv_y, 
	scale, scale,
	c_white, 1
);

#endregion

#region Player Info

c = c_black;

// Player name
draw_set_font(fnt_text_24);
draw_text_color(gui_info_x, gui_info_y, info_grid[# 0, 0] + ": " + info_grid[# 1, 0], c, c, c, c, 1);

// Coins
draw_set_font(fnt_small_digits);

yy = 0;
repeat (3) {
	draw_text_color(
		gui_info_x + (192 * scale) + ((15 + 18) * scale * yy), 
		gui_info_y, 
		string(info_grid[# 1, yy + 1]), 
		c, c, c, c, 1
	);
	yy += 1;
}

draw_set_font(0);

#endregion

#region Draw Item Description

if (moused_over_slot != -1) {
	var description = "";

	ci = inv_grid[# 0, moused_over_slot];

	if (ci > 0) {
		var name = desc_grid[# 0, ci]; 
		var desc = desc_grid[# 1, ci];
	
		description = name + ". " + desc;
		c = c_black;
	
		draw_set_font(fnt_text_12);
		draw_text_ext_color(
			gui_desc_x, gui_desc_y, 
			description, gui_text_height, 
			gui_inv_width * scale - (inv_slots_buffer_x * 2),
			c, c, c, c, 1
		);
	}
}

#endregion

#region Inventory Items

repeat (inv_slots) {
	// x,y location for slot
	xx = gui_slot_x + ((cell_size + inv_slots_buffer_x) * ix * scale);
	yy = gui_slot_y + ((cell_size + inv_slots_buffer_y) * iy * scale);
	
	// Item
	ci = inv_grid[# 0, ii];	
	sx = (ci mod spr_inv_items_columns) * cell_size;
	sy = (ci div spr_inv_items_columns) * cell_size;
		
	//show_debug_message("col: " + string(spr_inv_items_columns) + ", row: " + string(spr_inv_items_rows));
	//show_debug_message("ci: " + string(ci) + ", sx: " + string(sx) + ", sy: " + string(sy));
	
	// Draw Slot
	draw_sprite_part_ext(
		spr_inv_UI, 0, 
		0, 0, cell_size, cell_size,
		xx, yy,
		scale, scale,
		c_white, 1
	);
		
	if (ci > 0) {
		// Draw Item
		switch (ii) {
			case moused_over_slot:
				draw_sprite_part_ext(
					spr_inv_items, 0,
					sx, sy, cell_size, cell_size,
					xx, yy,
					scale, scale,
					c_white, 1
				);
				
				gpu_set_blendmode(bm_add);				
				draw_sprite_part_ext(
					spr_inv_UI, 0, 
					0, 0, cell_size, cell_size,
					xx, yy,
					scale, scale,
					c_white, 0.3
				);				
				gpu_set_blendmode(bm_normal);
				break;
			case picked_slot:
				draw_sprite_part_ext(
					spr_inv_items, 0,
					sx, sy, cell_size, cell_size,
					xx, yy,
					scale, scale,
					c_white, 0.2
				);
				break;
			default:
				draw_sprite_part_ext(
					spr_inv_items, 0,
					sx, sy, cell_size, cell_size,
					xx, yy,
					scale, scale,
					c_white, 1
				);
				break;
		}
	
		// Draw item Number
		num = inv_grid[# 1, ii];
	
		switch (ii) {
			case picked_slot:
				draw_text_color(xx, yy, string(num), c, c, c, c, 0.2);
				break;
			default:
				draw_text_color(xx, yy, string(num), c, c, c, c, 1);
				break;
		}
			
	}
	
	// Increment
	ii += 1;
	ix = ii mod inv_slots_width;	
	iy = ii div inv_slots_width;
}

#region Item Pickup

// Picking up the item within inventory
if (picked_slot != -1) {
	ci = inv_grid[# 0, picked_slot];	
	num = inv_grid[# 1, picked_slot];
	
	sx = (ci mod spr_inv_items_columns) * cell_size;
	sy = (ci div spr_inv_items_columns) * cell_size;
		
	draw_sprite_part_ext(
		spr_inv_items, 0,
		sx, sy, cell_size, cell_size,
		gui_mouse_x, gui_mouse_y,
		scale, scale,
		c_white, 1
	);
	
	draw_text_color(gui_mouse_x + (cell_size / 4 * scale), gui_mouse_y, string(num), c, c, c, c, 1);
}

#endregion

#endregion