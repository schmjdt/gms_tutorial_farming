/// @description 

if (!game.gui_inventory) exit;

draw_sprite_part_ext(
	spr_inv_UI, 0, 
	cell_size, 0, 
	gui_inv_width, gui_inv_height, 
	gui_inv_x, gui_inv_y, 
	scale, scale,
	c_white, 1
);