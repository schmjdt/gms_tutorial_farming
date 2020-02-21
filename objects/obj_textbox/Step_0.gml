/// @description 

if (keyboard_check_pressed(interact_key)) {
	if (page < array_length_1d(text) - 1) {
		page += 1;
		counter = 0;
	} else {
		instance_destroy();	
	}	
}