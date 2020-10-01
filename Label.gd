extends Label


func _process(_delta):
	text = str(get_tree().get_node("Ship").position.x)
