/// @description instance_create_crop
/// @arg layer_name
/// @arg x
/// @arg y

var layer_id = layer_get_id(argument0);
var map_id = layer_tilemap_get_id(layer_id);
var data = tilemap_get_at_pixel(map_id, argument1, argument2);

var result = data != 0;

return result;