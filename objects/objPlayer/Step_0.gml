/// @description Insert description here

// if we press a button, move the player
if(keyboard_check(vk_left)) 
{
	// move the player left
	x -= 2;
}

if(keyboard_check(vk_right)) 
{
	// move the player right
	x += 2;
}

if(keyboard_check(vk_up)) 
{
	// move the player up
	y -= 2;
}

if(keyboard_check(vk_down)) 
{
	// move the player down
	y += 2;
}
