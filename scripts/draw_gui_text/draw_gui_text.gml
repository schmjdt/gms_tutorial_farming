/// @description draw_gui_text
/// @arg list
/// @arg x
/// @arg y
/// @arg color

draw_set_font(fnt_text_9);
font_height = string_height("M")
	
var yy = 0;
repeat (array_length_1d(argument0)) {
	c = argument3;
	draw_text_color(argument1, argument2 + (font_height * yy), argument0[yy], c, c, c, c, 1);
	yy += 1;
}