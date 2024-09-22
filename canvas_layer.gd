extends Node3D

#Load the resourse using preload
const TextBubbleResource = preload("res://text_bubble.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var dream_lines = FileAccess.open("res://dream_script.txt", FileAccess.READ).get_as_text().split("\n")
	print(dream_lines)


	var text_bubble = TextBubbleResource.instantiate()
	text_bubble.set_text(dream_lines[0])
	$Camera3D.add_child(text_bubble)





# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
