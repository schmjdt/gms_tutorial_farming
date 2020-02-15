/// @description 

select_crop = 0;
planting = false;

cell_size = 32;

mx = 0;
my = 0;

ds_crops_types = -1;
ds_crops_instances = -1;
ds_crops_data = ds_grid_create(4, 1);
ds_grid_clear(ds_crops_data, -1);

// TODO: Pull from XML ??
enum crop {
	tomato,
	potato,
	carrot,
	artichoke,
	chilli,
	gourd,
	corn
};

// TODO: Pull from XML
create_crop_type(4, 40, "tomato");
create_crop_type(3, 35, "potato");
create_crop_type(2, 25, "carrot");
create_crop_type(4, 45, "artichoke");
create_crop_type(3, 30, "chilli");
create_crop_type(2, 20, "gourd");
create_crop_type(5, 50, "corn");