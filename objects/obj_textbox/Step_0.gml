/// @description 

if (keyboard_check_pressed(interact_key)) {
	if (page < array_length_1d(text) - 1) {
		page += 1;	
	} else {
		instance_destroy();	
	}	
}