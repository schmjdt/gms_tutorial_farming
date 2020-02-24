/// @description Use script

// Just -1         -1
// Array		   [script, arg0, arg1...]
// Array of Arrays [[script, arg0, arg1...]]
// Array of -1     [-1]

// TODO: Add capability of executing multiple scripts or use wrapper script

if (scripts == -1) exit;

var _script = scripts[page];

if (choice_dialogue) _script = _script[choice_selection];

if (_script == -1) exit;

var _len = array_length_1d(scripts);

if (_len == 1) {
	script_execute(_script[0]);
} else {
	var _args = array_create(_len - 1, 0);
	array_copy(_args, 0, _script, 1, _len - 1);
	script_execute_alt(_script[0], _args);
}
