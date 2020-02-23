/// @description 

if (keyboard_check_pressed(interact_key)) {
	if (!choice_dialogue and counter < str_len) {
		counter = str_len;
	} else if (page < array_length_1d(text) - 1) {
		var line = next_line[page];
		
		if (choice_dialogue) {
			line = line[choice_selection];	
		}
				
		switch (line) {
			case Dialogue.next:
				page += 1;	
				break;
			case Dialogue.quit:
				instance_destroy();
				
				with (speakers[0]) {
					can_move = true;	
				}
				
				exit;
			default:
				page = line;
				break;
		}
		
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