extends TileMapLayer
class_name Foreground

var terrain_set := 0
var terrain := 0
var ignore_empty_terrains := true

# tile_pos is coodirnates on the tilemap and not a global position
func place_block(tile_source: int, tile_pos : Vector2i, caster : Node = null) -> void:
	set_cell(tile_pos, tile_source)
	
	var to_update : Array = []
	var surrounding = get_surrounding_cells(tile_pos)
	for cell in surrounding:
		if get_cell_source_id(cell) != -1:
			to_update.append(cell)
			set_cell(cell, -1)
	
	set_cells_terrain_connect(to_update, terrain_set, terrain, ignore_empty_terrains)
