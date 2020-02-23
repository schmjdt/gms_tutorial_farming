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


text[0] = "";
speakers[0] = 0;
page = 0;
counter = 0;
pause_text = false;

choice_selection = 0;
choice_color = c_white;

name  = "NPC";
voice = snd_voice1;
portrait_index = 0;

c_text = c_black;
c_name = c_black;

font = fnt_text_9;

interact_key = vk_space;

draw_set_font(font);
text_height = string_height("M");