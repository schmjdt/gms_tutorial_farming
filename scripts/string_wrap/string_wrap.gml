/// @desc string_wrap
/// @arg string
/// @arg max_width

// Implementation adapted from Heartbeast's RPG Tutorial on Dialouge

var str		  = argument0;
var max_width = argument1;

var str_len = string_length(str);
var last_space = 1;

var substr, str_width;
var count = 1;

repeat (str_len) {	
	substr = string_copy(str, 1, count);
	str_width = string_width(substr)
	
	if (string_char_at(substr, count) == " ") {
		last_space = count;	
	}
	
	if (str_width > max_width) {
		// Remove the space
		str = string_delete(str, last_space, 1);
		// Add the newline
		str = string_insert("\n", str, last_space);		
	}
	
	count += 1;
}

return str;