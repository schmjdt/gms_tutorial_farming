/// @description Use script

if (scripts == -1 or scripts[page] == -1) exit;

// [script, arg0, arg1...]
var _script = scripts[page];

var _len = array_length_1d(scripts);

if (_len == 1) {
	script_execute(_script[0]);
} else {
	var _args = array_create(_len - 1, 0);
	array_copy(_args, 0, _script, 1, _len - 1);
	script_execute_alt(_script[0], _args);
}
