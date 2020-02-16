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