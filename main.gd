extends Node3D

var mouse_sens = 0.3
var camera_anglev=0

var min_y_rotation = 0
var max_y_rotation = PI/2

func _input(event):  		
	if event is InputEventMouseMotion:
		$Camera3D.rotate_y(deg_to_rad(-event.relative.x*mouse_sens))
		if $Camera3D.rotation.y > max_y_rotation: $Camera3D.rotation.y = max_y_rotation
		if $Camera3D.rotation.y < min_y_rotation: $Camera3D.rotation.y = min_y_rotation
		$Camera3D/DialogOverlay.direction = (max_y_rotation - $Camera3D.rotation.y) / min_y_rotation
		



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
