/// @description 

if (keyboard_check_pressed(ord("P"))) {
	planting = !planting;
}

if (planting) {
	mx = mouse_x;
	my = mouse_y;
	
	if (mouse_wheel_up()) {
		select_crop += 1;
		if (select_crop > sprite_get_number(spr_crops_picked) - 1) {
			select_crop = 0;
		}
	}
	
	if (mouse_wheel_down()) {
		select_crop -= 1;
		if (select_crop <  0) {
			select_crop = sprite_get_number(spr_crops_picked) - 1;
		}
	}
	
	if (mouse_check_button_pressed(mb_left)) {
		instance_create_crop(mx, my, select_crop);
	}
}