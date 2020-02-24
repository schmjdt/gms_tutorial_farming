/// @desc change_variable
/// @arg object_id
/// @arg var_name_string
/// @arg value

// NOTE: Will set the variable to all instances of that object
with (argument[0]) {
	// Use the instance id of the object id	
	variable_instance_set(id, argument[1], argument[2]);
}