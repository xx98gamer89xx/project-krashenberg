extends Node2D

@export var target_room: String
var game_manager
var mouse_inside
signal target_room_changed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_inside = false
	game_manager = self.get_parent().get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click") && mouse_inside == true:
		go_to_room(target_room)

func go_to_room(target_room):
	game_manager.target_room_string = "./" + target_room
	target_room_changed.emit()


func _on_mouse_entered() -> void:
	mouse_inside = true


func _on_mouse_exited() -> void:
	mouse_inside = false
