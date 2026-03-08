extends CharacterBody2D
class_name Player

@export var tilemap: TileMapLayer
@export var selected_tile: int = 1

const SPEED := 400
const JUMP_FORCE : float = 700.0
const ACCELERATION : float = 0.1
const DECELERATION : float = 0.1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		var grid_pos = tilemap.local_to_map(tilemap.get_local_mouse_position())
		
		if event.button_index == MouseButton.MOUSE_BUTTON_LEFT:
			tilemap.set_cell(grid_pos, selected_tile)
		elif event.button_index == MouseButton.MOUSE_BUTTON_RIGHT:
			tilemap.set_cell(grid_pos, -1)
		print(grid_pos)
	

func _physics_process(delta: float) -> void:	
	move_and_slide()
