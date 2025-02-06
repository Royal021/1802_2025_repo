extends Control

var just_paused = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause") and just_paused == false:
		get_tree().paused = false
		self.visible = false
		just_paused= true
	else:
		just_paused = false
