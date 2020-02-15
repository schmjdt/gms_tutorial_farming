/// @description 

if (keyboard_check_pressed(vk_escape)) { game_end();		   }
if (keyboard_check_pressed(vk_f1))	   { debug = !debug;	   }
if (keyboard_check_pressed(ord("R")))  { game_restart();	   }
if (keyboard_check_pressed(ord("P")))  { planting = !planting; }
if (keyboard_check_pressed(ord("G")))  { check_crop_growth();  }