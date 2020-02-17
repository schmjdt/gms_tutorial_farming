/// @description 

if (!game.gui_inventory) exit;

moused_over_slot = -1;
		
var gui_mouse_x = device_mouse_x_to_gui(0);
var gui_mouse_y = device_mouse_y_to_gui(0);

var cell_buffer_x = (cell_size + inv_slots_buffer_x) * scale;
var cell_buffer_y = (cell_size + inv_slots_buffer_y) * scale;

var inv_mouse_x = gui_mouse_x - gui_slot_x;
var inv_mouse_y = gui_mouse_y - gui_slot_y;

if (inv_mouse_x > 0 and inv_mouse_x < gui_slot_x + (cell_size * scale) and
	inv_mouse_y > 0 and inv_mouse_y < gui_slot_y + (cell_size * scale)) {
	var nx = inv_mouse_x div cell_buffer_x;
	var ny = inv_mouse_y div cell_buffer_y;

	var sx = inv_mouse_x - (nx * cell_buffer_x);
	var sy = inv_mouse_y - (ny * cell_buffer_y);
	
	if (nx >= 0 and nx <= inv_slots_width and
		ny >= 0 and ny <= inv_slots_height and
	    sx < cell_size * scale and 
		sy < cell_size * scale) {
		mouse_slot_x = nx;
		mouse_slot_y = ny;
	
		var tmp_mos = mouse_slot_x + (mouse_slot_y * inv_slots_width);

		if (tmp_mos >= 0 and tmp_mos < inv_slots) {
			moused_over_slot = tmp_mos;
			if (moused_over_slot != moused_over_slot_last) {
				moused_over_slot_last = moused_over_slot;
				show_debug_message("Selected: " + string(moused_over_slot));
			}
		}
	}
}