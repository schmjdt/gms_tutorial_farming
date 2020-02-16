/// @description merge_number
/// @arg num1
/// @arg num2
/// @arg amount

var num1 = argument0;
var num2 = argument1;
var amount = argument2;

var diff	= num1 - num2;
var merged	= num1 - (diff * amount);

return merged;