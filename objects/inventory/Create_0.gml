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
inv_UI_width = 288;
inv_UI_height = 192;

inv_UI_x = (gui_width / 2) - (inv_UI_width / 2 * scale);
inv_UI_y = (gui_height / 2) - (inv_UI_height / 2 * scale);