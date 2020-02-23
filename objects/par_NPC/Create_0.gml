/// @description npc initialization

event_inherited();

// Character Movement

spd_slow = 1;
spd_norm = 2;
spd_fast = 3;

spd = spd_norm;

// Character Sprites

anim_length = 9;
anim_speed = 12;
anim_fps = 60;
frame_size = 64;

x_frame = 1;
y_frame = 10;

moveX = 0;
moveY = 0;
can_move = true;

// NOTE: mask defaulted to human npc
x_offset = sprite_get_xoffset(mask_index)
y_offset = sprite_get_yoffset(mask_index)

spr_shadow  = spr_character_shadow

// TODO: Add shaders for even more color choices
spr_base	= -1;
spr_feet	= -1;
spr_torso	= -1;
spr_legs	= -1;
spr_hair	= -1;

// Start NPC movement right away after creation
alarm[1] = 1;

// Dialogue
name  = "Unknown";
voice = snd_voice1;
portrait_index = 0;

text = ["..."];
speakers = [id];