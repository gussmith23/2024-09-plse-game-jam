extends Node

@onready var script_lines = FileAccess.open(self.get_meta("script_file"), FileAccess.READ).get_as_text().split("\n")
var index = 0

signal new_line(from: String, line: String)

func next() -> void:
	print("next")
	assert(index < script_lines.size())
	print("emitting")
	new_line.emit(self.get_meta("boring_or_dream"), script_lines[index])
	index += 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
