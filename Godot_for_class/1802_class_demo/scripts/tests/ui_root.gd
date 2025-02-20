extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/HBoxContainer/health_label.text ="HP: " + str(MyGlobals.player_health)
	$MarginContainer/VBoxContainer/HBoxContainer/score_label.text = "Score: " + str(MyGlobals.player_score)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$MarginContainer/VBoxContainer/HBoxContainer/health_label.text = "HP: " + str(MyGlobals.player_health)
	$MarginContainer/VBoxContainer/HBoxContainer/score_label.text = "Score: " + str(MyGlobals.player_score)
