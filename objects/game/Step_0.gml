/// @description Insert description here

if (keyboard_check_pressed(vk_f1))		{ debug = !debug;	}
if (keyboard_check_pressed(ord("R")))	{ game_restart();	}
if (keyboard_check_pressed(vk_escape))	{ game_end();		}