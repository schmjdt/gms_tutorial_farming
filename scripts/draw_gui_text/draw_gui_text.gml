/// @description draw_gui_text
/// @arg list
/// @arg x
/// @arg y
/// @arg color

lst = argument0
var yy = 0;

repeat (ds_list_size(lst)) {
	c = argument3;
	draw_text_color(argument1, argument2 + (20 * yy), lst[| yy], c, c, c, c, 1);
	yy += 1;
}