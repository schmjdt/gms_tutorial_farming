/// @description

box		 = spr_textbox;
frame	 = spr_portrait_frame;
portrait = spr_portraits;
namebox  = spr_namebox;

box_width	    = sprite_get_width(box);
box_height      = sprite_get_height(box);
port_width	    = sprite_get_width(portrait);
port_height	    = sprite_get_height(portrait);
namebox_width	= sprite_get_width(namebox);
namebox_height  = sprite_get_height(namebox);

port_x	  = (global.game_width - box_width - port_width) * 0.5;
port_y	  = (global.game_height * 0.98) - port_height;
box_x	  = port_x + port_width;
box_y	  = port_y;
namebox_x = port_x;
namebox_y = port_y - namebox_height;

x_buffer = 12;
y_buffer =  8;

text_max_width = box_width - (2 * x_buffer);

text_x = box_x + x_buffer;
text_y = box_y + y_buffer;
name_x = namebox_x + (namebox_width  / 2);
name_y = namebox_y + (namebox_height / 2);

portrait_index = 0;

text[0] = "this is a test string. this is a test string. this is a test string. this is a test string. this is a test string. this is a test string. this is a test string. this is a test string.";
text[1] = "this is the second page";
page = 0;
counter = 0;

name  = "NPC";
voice = snd_voice1;

c_text = c_black;
c_name = c_black;

font = fnt_text_9;

interact_key = vk_space;