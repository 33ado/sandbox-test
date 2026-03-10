extends CharacterBody2D
class_name Player

@export var tilemap: Foreground
@export var selected_tile: int = -1

const SPEED := 400
const JUMP_FORCE : float = 700.0
const ACCELERATION : float = 0.3
const DECELERATION : float = 0.4
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	pass 

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MouseButton.MOUSE_BUTTON_LEFT:
			tilemap.place_block(get_global_mouse_position(), selected_tile)
		if event.button_index == MouseButton.MOUSE_BUTTON_RIGHT:
			tilemap.delete_block(get_global_mouse_position())

func _physics_process(delta: float) -> void:	
	move_and_slide()
