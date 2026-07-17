extends Node2D

@export var movement_axis: int
@export var max_movement: int

var game_manager
var mouse_inside
var grabbing
var relative_mouse_position
var mouse_position


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	grabbing = false
	mouse_inside = false
	game_manager = self.get_parent().get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(grabbing)
	mouse_position = get_viewport().get_mouse_position()
	if Input.is_action_just_pressed("left_click") && mouse_inside == true:
		relative_mouse_position = mouse_position.y - $CollisionShape2D.position.y
		grabbing = true
	if grabbing == true:
		if not Input.is_action_pressed("left_click"):
			grabbing = false
		else:
			$CollisionShape2D.position.y = mouse_position.y - relative_mouse_position 

func _on_mouse_entered() -> void:
	mouse_inside = true

func _on_mouse_exited() -> void:
	mouse_inside = false
