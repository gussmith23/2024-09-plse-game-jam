extends CanvasLayer

#Load the resourse using preload
const TextBubbleResource = preload("res://text_bubble.tscn")

# What direction we're looking. a float between 0 and 1. Determines which audio stream you get.
var direction = 0;

# Text line display interval in s.
const text_interval = 1.5
const text_interval_random_variance = 1

var play_by_default = true;

func _hears_dream() -> bool:
	return direction > .4

func _hears_boring() -> bool:
	return direction < .6


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
var dream_accum = 0
var boring_accum = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	dream_accum += delta
	boring_accum += delta
	
	if dream_accum > text_interval + randf() * text_interval_random_variance:
		$DreamScript.next()
		dream_accum = 0
	if boring_accum > text_interval + randf() * text_interval_random_variance:
		$BoringScript.next()
		boring_accum = 0

func _on_script_new_line(from: String, line: String) -> void:
	assert(from == "dream" || from == "boring")
	if from == "dream" and _hears_dream():
		$RichTextLabel.text += "[color=#f82c00]%s[/color]" % line
	elif from == "boring" and _hears_boring():
		$RichTextLabel.text += "[color=#00def8]%s[/color]" % line
	

	$RichTextLabel.text += "\n"
