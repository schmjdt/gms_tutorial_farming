/// @description 

if (!game.gui_inventory) exit;

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

var info_grid = ds_player_info;
var c = c_black;

// Player name
draw_set_font(fnt_text_24);
draw_text_color(gui_info_x, gui_info_y, info_grid[# 0, 0] + ": " + info_grid[# 1, 0], c, c, c, c, 1);

// Coins
draw_set_font(fnt_small_digits);

var yy = 0;
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

#region Inventory Items

var inv_grid = ds_inventory;
var ii, ix, iy, xx, yy, ci, sx, sy, num;
ii = 0; ix = 0; iy = 0;

repeat (inv_slots) {
	// x,y location for slot
	xx = gui_slot_x + ((cell_size + inv_slots_buffer_x) * ix * scale);
	yy = gui_slot_y + ((cell_size + inv_slots_buffer_y) * iy * scale);
	
	// Item
	ci = inv_grid[# 0, ii];
	
	if (ci > 0) {
		// Draw Slot and Item	
		// -- Slot
		draw_sprite_part_ext(
			spr_inv_UI, 0, 
			0, 0, cell_size, cell_size,
			xx, yy,
			scale, scale,
			c_white, 1
		);
	
		sx = (ci mod spr_inv_items_columns) * cell_size;
		sy = (ci div spr_inv_items_columns) * cell_size;
		
		show_debug_message("col: " + string(spr_inv_items_columns) + ", row: " + string(spr_inv_items_rows));
		show_debug_message("ci: " + string(ci) + ", sx: " + string(sx) + ", sy: " + string(sy));
		
		// --- Item
		draw_sprite_part_ext(
			spr_inv_items, 0,
			sx, sy, cell_size, cell_size,
			xx, yy,
			scale, scale,
			c_white, 1
		);
	
		// Draw item Number
		num = inv_grid[# 1, ii];
	
		draw_text_color(xx, yy, string(num), c, c, c, c, 1);
	}
	
	// Increment
	ii += 1;
	ix = ii mod inv_slots_width;	
	iy = ii div inv_slots_width;
}

#endregion