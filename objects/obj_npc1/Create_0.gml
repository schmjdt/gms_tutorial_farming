/// @description

event_inherited();

spr_base	= spr_base_female_5;
spr_feet	= spr_feet_female_boots_black;
spr_torso	= spr_torso_female_sleeveless_white;
spr_legs	= spr_legs_female_pants_teal;
spr_hair	= spr_hair_female_ponytail_raven;

// Dialogue
name  = "Anna";
voice = snd_voice2;
portrait_index = 2;

text = ["Hello, my name is " + name, "Nice day for farming, isn't it?"];
speakers = [id, id];
next_line = [Dialogue.next, Dialogue.quit];