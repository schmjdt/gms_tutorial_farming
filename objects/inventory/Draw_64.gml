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
var c = c_yellow;
draw_text_color(gui_info_x, gui_info_y, info_grid[# 0, 0] + ": " + info_grid[# 1, 0], c, c, c, c, 1);

#endregion