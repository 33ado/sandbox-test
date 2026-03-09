extends CharacterBody2D
class_name Player

@export var tilemap: Foreground
@export var selected_tile: int = 0

const SPEED := 400
const JUMP_FORCE : float = 700.0
const ACCELERATION : float = 0.3
const DECELERATION : float = 0.4
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	pass 

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		var tile_pos = tilemap.local_to_map(tilemap.get_local_mouse_position())
		tilemap.place_block(selected_tile, tile_pos, self)
	

func _physics_process(delta: float) -> void:	
	move_and_slide()
