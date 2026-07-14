extends Node2D

var game_manager
var mouse_inside
var covered = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_inside= false
	game_manager = self.get_parent().get_parent()

func press_button():
	$Sprite2D.texture = "res://sprites/pressed_button.png"
	$Timer.start()
	

func uncover():
	covered = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left_click") && mouse_inside == true:
		if covered == false:
			press_button()
		else:
			uncover()

func _on_mouse_entered() -> void:
	mouse_inside = true

func _on_mouse_exited() -> void:
	mouse_inside = false


func _on_timer_timeout() -> void:
	$Timer.reset()
	$Sprite2D.texture = "res://sprites/unpressed_button.png"
	##cover()
