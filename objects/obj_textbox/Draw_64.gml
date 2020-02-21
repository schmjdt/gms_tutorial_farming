/// @description 

#region Draw Portrait GUI

#region Draw textbox

draw_sprite(box, 0, box_x, box_y);

#endregion

#region Draw Portrait Back

draw_sprite(frame, 0, port_x, port_y);

#endregion

#region Draw Portrait

draw_sprite(portrait, portrait_index, port_x, port_y);

#endregion

#region Draw Portrait Frame

draw_sprite(frame, 1, port_x, port_y);

#endregion

#region Draw Namebox

draw_sprite(namebox, 0, namebox_x, namebox_y);

#endregion

#endregion

#region Draw Portrait Text

draw_set_font(font);
var c;

#region Draw Name

draw_set_halign(fa_center);
draw_set_valign(fa_middle);
c = c_name;
draw_text_color(name_x, name_y, name, c, c, c, c, 1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

#endregion

#region Draw Text

if (!pause_text and counter < str_len) {
	// Speed of typewriter effect
	counter += 1;
	
	if (counter mod 4 == 0) {
		audio_play_sound(voice, 10, false);
	}
	
	switch(string_char_at(text_wrapped, counter)) {
		case ",": pause_text = true; alarm[1] = 15; break;
		case ".":
		case "?":
		case "!": pause_text = true; alarm[1] = 25; break;
	}
}

var substr = string_copy(text_wrapped, 1, counter);

c = c_text;
draw_text_color(text_x, text_y, substr, c, c, c, c, 1);

#endregion

#endregion