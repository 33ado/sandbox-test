extends TileMapLayer
class_name Foreground

var terrain_set := 0
var terrain := 0
var ignore_empty_terrains := true

func place_block(global_pos: Vector2i, tile_source: int) -> void:
	var tile_pos := local_to_map(to_local(global_pos))
	var surrounding = get_surrounding_cells(tile_pos)
	var to_update : Array = []
	
	to_update.append(tile_pos)
	for cell in surrounding:
		if get_cell_source_id(cell) != -1:
			to_update.append(cell)
			set_cell(cell, -1)
		
	set_cell(tile_pos, tile_source)
	set_cells_terrain_connect(to_update, terrain_set, terrain, ignore_empty_terrains)


func delete_block(global_pos: Vector2i):
	var tile_pos := local_to_map(to_local(global_pos))
	var surrounding = get_surrounding_cells(tile_pos)
	var to_update : Array = []
	
	for cell in surrounding:
		if get_cell_source_id(cell) != -1:
			to_update.append(cell)
			set_cell(cell, -1)
		
	set_cell(tile_pos, -1)
	set_cells_terrain_connect(to_update, terrain_set, terrain, ignore_empty_terrains)
	
