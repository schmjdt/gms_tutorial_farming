/// @description 

event_inherited();

cell_size = 32;
spr_item = spr_inventory_items;

spr_width = sprite_get_width(spr_item);
spr_height = sprite_get_height(spr_item);

item_num = -1;
x_frame = 0;
y_frame = 0;

x_offset = cell_size / 2;
y_offset = cell_size * (2 / 3);

drop_move = true;
item_dir = irandom_range(0, 259);
item_dst = 32;
goal_x = x + lengthdir_x(item_dst, item_dir);
goal_y = y + lengthdir_y(item_dst, item_dir);


detect_dst = 30;
pickup_dst = 2;