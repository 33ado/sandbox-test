extends TileMapLayer
class_name Foreground

# tile_pos is coodirnates on the tilemap and not a global position
func place_block(tile_source: int, tile_pos : Vector2i, caster : Node = null) -> void:
	set_cell(tile_pos, tile_source)
	update_surrounding(tile_pos)
	
func update_surrounding(tile_pos):
	var to_update : Array = []
	var surrounding = get_surrounding_cells(tile_pos)

	for cell in surrounding:
		if cell in get_used_cells():
			to_update.append(cell)
			set_cell(cell, -1)

		
	set_cells_terrain_connect(to_update, 0, 0, true)
