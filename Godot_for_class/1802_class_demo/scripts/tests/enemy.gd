extends Area3D

var health = 3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health <= 0:
		MyGlobals.player_score += 1
		queue_free()
	var to_move = self.global_position.direction_to(MyGlobals.player_pos) * delta
	self.global_position += to_move


func _on_body_entered(body):
	if body.is_in_group("projectile"):
		health -= 1
		body.free()
	elif body.is_in_group("player"):
		MyGlobals.player_health -= 1
		queue_free()
