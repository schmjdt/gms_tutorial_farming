/// @description 

if (!game.gui_inventory) exit;

draw_sprite_part_ext(
	spr_inv_UI, 0, 
	cell_size, 0, 
	inv_UI_width, inv_UI_height, 
	inv_UI_x, inv_UI_y, 
	scale, scale,
	c_white, 1
);