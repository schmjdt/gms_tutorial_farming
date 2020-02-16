/// @description 

if (keyboard_check_pressed(vk_escape)) { game_end();				}
if (keyboard_check_pressed(vk_f1))	   { debug = !debug;	        }
if (keyboard_check_pressed(vk_f2))	   { gui_vars = !gui_vars;		}
if (keyboard_check_pressed(vk_f5))     { pause_time = !pause_time;  }
if (keyboard_check_pressed(vk_f6))     { pause_game = !pause_game;  }
if (keyboard_check_pressed(ord("R")))  { game_restart();			}
if (keyboard_check_pressed(ord("P")))  { if (allows_planting()) crops.planting = !crops.planting; }
if (keyboard_check_pressed(ord("G")))  { increment_crop_growth(1);  }
if (keyboard_check_pressed(ord("I")))  { gui_inventory = !gui_inventory;  }