/// @description 

if (!game.gui_inventory) exit;

var gui_mouse_x = device_mouse_x_to_gui(0);
var gui_mouse_y = device_mouse_y_to_gui(0);

if (
	(gui_mouse_x >= gui_slot_x and gui_mouse_x <= gui_slot_x + gui_inv_width) and
	(gui_mouse_y >= gui_slot_y and gui_mouse_y <= gui_slot_y + gui_inv_height)) {
	var cell_buffer_x = (cell_size + inv_slots_buffer_x) * scale;
	var cell_buffer_y = (cell_size + inv_slots_buffer_y) * scale;

	var inv_mouse_x = gui_mouse_x - gui_slot_x;
	var inv_mouse_y = gui_mouse_y - gui_slot_y;

	var nx = inv_mouse_x div cell_buffer_x;
	var ny = inv_mouse_y div cell_buffer_y;

	mouse_slot_x = nx;
	mouse_slot_y = ny;

	moused_over_slot = mouse_slot_x + (mouse_slot_y * inv_slots_width);
	if (moused_over_slot != moused_over_slot_last) {
		moused_over_slot_last = moused_over_slot;
		show_debug_message("Selected: " + string(moused_over_slot));
	}
}