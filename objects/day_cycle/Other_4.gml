/// @description 

// Only draw the skybox if in an "outside" room
switch (room) {
	case rm_farm:
	case rm_forest: skybox_draw = true; break;
	
	default: skybox_draw = false;
}