extends Sprite

func _input(event):
	if event is InputEventMouseMotion:
		global_position = event.position
