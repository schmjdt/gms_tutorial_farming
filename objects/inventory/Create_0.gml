/// @description 

// Set depth so that it appears on top of everything
depth = -1;

// Correct for resolution of room
scale = 2;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

// Size of sprites
cell_size = 32;

// Inventory UI Info
spr_inv_UI = spr_inventory_UI;
gui_inv_width = 288;
gui_inv_height = 192;

gui_inv_x = (gui_width / 2) - (gui_inv_width / 2 * scale);
gui_inv_y = (gui_height / 2) - (gui_inv_height / 2 * scale);

#region Player Info
/* --- Player Info
	0 = Name
	1 = Gold
	2 = Silver
	3 = Copper
*/

ds_player_info = ds_grid_create(2, 4);
ds_player_info[# 0, 0] = "Name";
ds_player_info[# 0, 1] = "Gold";
ds_player_info[# 0, 2] = "Silver";
ds_player_info[# 0, 3] = "Copper";

// TODO: remove random testing numbers
ds_player_info[# 1, 0] = "Player";
ds_player_info[# 1, 1] = irandom_range(0, 99);
ds_player_info[# 1, 2] = irandom_range(0, 99);
ds_player_info[# 1, 3] = irandom_range(0, 99);

gui_info_x = gui_inv_x + (9 * scale);
gui_info_y = gui_inv_y + (9 * scale);

#endregion