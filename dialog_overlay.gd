extends CanvasLayer

#Load the resourse using preload
const TextBubbleResource = preload("res://text_bubble.tscn")

# What direction we're looking. a float between 0 and 1. Determines which audio stream you get.
var direction = 0;

var play_by_default = true;

func _hears_dream() -> bool:
	return direction > .4

func _hears_boring() -> bool:
	return direction < .6

func _init(play_by_default_: bool = true) -> void:
	play_by_default = play_by_default_

func start() -> void:
	$DreamAnimationPlayer.play("dream_script")
	$BoringAnimationPlayer.play("boring_script")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if play_by_default:
		start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_script_new_line(from: String, line: String) -> void:
	print(from, line)
	assert(from == "dream" || from == "boring")
	if from == "dream" and _hears_dream():
		$RichTextLabel.text += "[color=#f82c00]%s[/color]" % line
	elif from == "boring" and _hears_boring():
		$RichTextLabel.text += "[color=#00def8]%s[/color]" % line

	$RichTextLabel.text += "\n"
