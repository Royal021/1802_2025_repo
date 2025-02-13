extends Node3D

var arrow_premade = load("res://scripts/goblin_character/arrow.tscn") 


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("attack"):
		var new_arrow = arrow_premade.instantiate()
		$projectile_container.add_child(new_arrow)
		new_arrow.global_position = $goblin_root/arrow_container.global_position
		new_arrow.linear_velocity = transform.basis.z * 10
