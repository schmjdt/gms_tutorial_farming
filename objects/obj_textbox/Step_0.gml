/// @description 

if (keyboard_check_pressed(interact_key)) {
	if (counter < str_len) {
		counter = str_len;
	} else if (page < array_length_1d(text) - 1) {
			page += 1;
			event_perform(ev_other, ev_user1);
	} else {
		with (speakers[0]) {
			can_move = true;	
		}
		
		instance_destroy();	
	}
}