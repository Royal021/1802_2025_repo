extends RigidBody3D

var damage = 10

var lifetime = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if lifetime <= 0:
		self.free()
	lifetime -= delta


func _on_body_entered(body):
	print("here")
	if body.is_in_group("enemy"):
		body.health -= damage
		self.free()
	elif body.is_in_group("environment"):
		self.free()
