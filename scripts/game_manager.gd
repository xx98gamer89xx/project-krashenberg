extends Node2D
var target_room
var target_room_string

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	target_room_string = "./ControlRoom"
	target_room_changed()
	for node in self.get_children():
		for node_children in node.get_children():
			if node_children.name == "Door" or node_children.name == "Door2":
				node_children.connect("target_room_changed", target_room_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func target_room_changed():
	target_room = get_node(target_room_string)
	for node in self.get_children():
		node.position = Vector2(-1600, 0)
	target_room.position = Vector2(0,0)
