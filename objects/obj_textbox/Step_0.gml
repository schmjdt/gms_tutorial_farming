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

if (choice_dialogue) {
	choice_selection += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	
	// If want to wrap around choices
	if		(choice_selection > text_array_length - 1)	choice_selection = 0;	
	else if (choice_selection < 0)						choice_selection = text_array_length - 1;
	
	// If don't want selection to wrap
	//choice_selection = clamp(choice_selection, 0, text_array_length - 1);
}