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

portrait_index = 0;