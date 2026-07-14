extends Node2D

var game_manager
var mouse_inside
var state = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_inside = false
	game_manager = self.get_parent().get_parent()

func change_state():
	if state == 1:
		state = 0
		$Sprite2D.texture = "res://sprite/switch_down.png"
		##action
	elif state == 0:
		state = 1
		$Sprite2D.texture = "res://sprite/switch_up.png"
		##action

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click") && mouse_inside == true:
		change_state()

func _on_mouse_entered() -> void:
	mouse_inside = true


func _on_mouse_exited() -> void:
	mouse_inside = false
