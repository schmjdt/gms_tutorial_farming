/// @description draw_gui_text
/// @arg list
/// @arg x
/// @arg y
/// @arg color

var yy = 0;
repeat (array_length_1d(argument0)) {
	c = argument3;
	draw_text_color(argument1, argument2 + (20 * yy), argument0[yy], c, c, c, c, 1);
	yy += 1;
}