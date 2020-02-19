/// @description 

// Set depth so that it appears on top of everything
depth = -1;

// Correct for resolution of room
scale = game.room_scale;

// GUI's actual width and height
gui_width  = display_get_gui_width();
gui_height = display_get_gui_height();

// Inventory UI Info
spr_inv_UI    = spr_inventory_UI;
spr_inv_items = spr_inventory_items;

// Size of sprites
cell_size = 32;

// Inventory UI width and height
gui_inv_width  = 288;
gui_inv_height = 192;

gui_inv_x = (gui_width  / 2) - (gui_inv_width  / 2 * scale);
gui_inv_y = (gui_height / 2) - (gui_inv_height / 2 * scale);

gui_info_x = gui_inv_x + (9 * scale);
gui_info_y = gui_inv_y + (9 * scale);

gui_slot_x = gui_inv_x + (9  * scale);
gui_slot_y = gui_inv_y + (40 * scale);

#region Player Info
/* --- Player Info
	0 = Name
	1 = Gold
	2 = Silver
	3 = Copper
*/

ds_player_info = ds_grid_create(2, 4);
ds_player_info[# 0, 0] = "Name";
ds_player_info[# 0, 1] = "Gold";
ds_player_info[# 0, 2] = "Silver";
ds_player_info[# 0, 3] = "Copper";

// TODO: remove random testing numbers
ds_player_info[# 1, 0] = "Player";
ds_player_info[# 1, 1] = irandom_range(0, 99);
ds_player_info[# 1, 2] = irandom_range(0, 99);
ds_player_info[# 1, 3] = irandom_range(0, 99);

#endregion

#region Inventory Item GUI

// Number of items in sprite sheet for column and row
spr_inv_items_columns = sprite_get_width(spr_inv_items)  / cell_size;
spr_inv_items_rows	  = sprite_get_height(spr_inv_items) / cell_size;

// Total available inventory slots
inv_slots			= 17;
// Available inventory slots for column and row
inv_slots_width		= 8;
inv_slots_height	= 3;

// Border between inventory slots
inv_slots_buffer_x	= 2;
inv_slots_buffer_y	= 4;

moused_over_slot = -1;
moused_over_slot_last = -2;
picked_slot = -1;

mouse_slot_x = -1;
mouse_slot_y = -1;

#endregion

#region Inventory Item Description GUI

gui_desc_x = gui_inv_x + (9  * scale);
gui_desc_y = gui_inv_y + (156 * scale);

gui_text_height = string_height("M");

#endregion

#region Inventory
/* --- Inventory
	0 = Item
	1 = Number
*/

ds_inventory = ds_grid_create(2, inv_slots);

// TODO: load from xml??
enum item {
	none		= 0,
	tomato		= 1,
	potato		= 2,
	carrot		= 3,
	artichoke	= 4,
	chilli		= 5,
	gourd		= 6,
	corn		= 7,
	wood		= 8,
	stone		= 9,
	bucket		= 10,
	chair		= 11,
	picture		= 12,
	axe			= 13,
	potion		= 14,
	starfish	= 15,
	mushroom	= 16,
	height		= 17,
}

#region Create Items Description Grid

ds_items_desc = ds_grid_create(2, item.height);

var z = 0;

// --- Name
ds_items_desc[# z, item.none] = "Nothing";
ds_items_desc[# z, item.tomato] = "Tomato";
ds_items_desc[# z, item.potato] = "Potato";
ds_items_desc[# z, item.carrot] = "Carrot";
ds_items_desc[# z, item.artichoke] = "Artichoke";
ds_items_desc[# z, item.chilli] = "Chilli";
ds_items_desc[# z, item.gourd] = "Gourd";
ds_items_desc[# z, item.corn] = "Corn";
ds_items_desc[# z, item.wood] = "Wood";
ds_items_desc[# z, item.stone] = "Stone";
ds_items_desc[# z, item.bucket] = "Bucket";
ds_items_desc[# z, item.chair] = "Chair";
ds_items_desc[# z, item.picture] = "Picture";
ds_items_desc[# z, item.axe] = "Axe";
ds_items_desc[# z, item.potion] = "Potion";
ds_items_desc[# z, item.starfish] = "Starfish";
ds_items_desc[# z, item.mushroom] = "Mushroom";

z = 1;
// --- Desc
ds_items_desc[# z, item.none] = "Empty.";
ds_items_desc[# z, item.tomato] = "To-mah... may-to.";
ds_items_desc[# z, item.potato] = "Pre-chips.";
ds_items_desc[# z, item.carrot] = "Keep away from rabbits.";
ds_items_desc[# z, item.artichoke] = "The heartiest vegetable.";
ds_items_desc[# z, item.chilli] = "But oddly hot.";
ds_items_desc[# z, item.gourd] = "Or is it an eggplant?";
ds_items_desc[# z, item.corn] = "Better popped";
ds_items_desc[# z, item.wood] = "Knock on it.";
ds_items_desc[# z, item.stone] = "There's nothing written in it.";
ds_items_desc[# z, item.bucket] = "You could fit a bucket-full of watert in here!";
ds_items_desc[# z, item.chair] = "This chair is just right.";
ds_items_desc[# z, item.picture] = "Wait, who even is this?";
ds_items_desc[# z, item.axe] = "Chop chop!";
ds_items_desc[# z, item.potion] = "The liquid looks... oozy.";
ds_items_desc[# z, item.starfish] = "So called becase it looks like a star.";
ds_items_desc[# z, item.mushroom] = "A fungus; not mush room for interpretation";

#endregion

// TODO: testing - random inventory
var yy = 0;
repeat (inv_slots) {
	ds_inventory[# 0, yy] = irandom_range(1, item.height - 1);
	ds_inventory[# 1, yy] = irandom_range(1, 10);	

	show_debug_message(string(ds_inventory[# 0, yy]));
	yy += 1;
}

#endregion