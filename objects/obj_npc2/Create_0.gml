/// @description

event_inherited();

spr_base	= spr_base_female_3;
spr_feet	= spr_feet_female_longboots_brown;
spr_torso	= spr_torso_female_sleeveless_red;
spr_legs	= spr_legs_female_pants_magenta;
spr_hair	= spr_hair_female_pixie_blonde;

// Dialogue
name  = "Cathy";
voice = snd_voice2;
portrait_index = 4;

text = [
	"Hey, what's your name?",
	[
		"I'm the Player. I'm kind of a big deal. And this is a long choice. And this is a long choice. And this is a long choice.",
		"Hey, I'm Cathy too.",
		"Wouldn't you like to know!",
		"I'm not supposed to talk to strangers."
	],
	"Right..."
];

speakers = [id, obj_player, id];