extends Node3D

var arrow_premade = load("res://scripts/goblin_character/arrow.tscn") 
var enemy_premade = load("res://scripts/tests/enemy.tscn")

var spawn_timer = 3
#notes
#z range from -9, 9
#x range -15, 15

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if MyGlobals.player_health <= 0:
		quit_game()
	
	if Input.is_action_just_pressed("attack"):
		var new_arrow = arrow_premade.instantiate()
		$projectile_container.add_child(new_arrow)
		new_arrow.global_position = $goblin_root/arrow_container.global_position
		new_arrow.global_rotation = $goblin_root/arrow_container.global_rotation
		new_arrow.linear_velocity = $goblin_root.global_transform.basis.z * 10
	
	#send current goblin position to globals
	MyGlobals.player_pos = $goblin_root.global_position
	
	#span enemies
	spawn_timer -= delta
	if spawn_timer < 0:
		var enemies_to_spawn = 4
		
		while enemies_to_spawn > 0:
			for spawner in $goblin_root/spawner_container.get_children():
				if enemies_to_spawn > 0:
					if spawner.can_spawn:
						var new_enemy = enemy_premade.instantiate()
						$enemy_list.add_child(new_enemy)
						new_enemy.global_position = spawner.global_position
						enemies_to_spawn -= 1
		spawn_timer = 3 - MyGlobals.player_score * 0.01
	
	$Camera3D.global_position = Vector3(
		$goblin_root.global_position.x,
		$Camera3D.global_position.y,
		$goblin_root.global_position.z,
		)
	
	


func _on_play_area_area_exited(area):
	if area.is_in_group("spawner"):
		area.can_spawn = false


func _on_play_area_area_entered(area):
	if area.is_in_group("spawner"):
		area.can_spawn = true
		
		
func save_to_file(content):
	var file = FileAccess.open("res://save_game.txt", FileAccess.WRITE)
	file.store_string(content)

func load_from_file():
	check_for_high_score_file("res://")
	var file = FileAccess.open("res://save_game.txt", FileAccess.READ)
	var content = file.get_as_text()
	return content
	
func quit_game():
	var prev_high_score = load_from_file()
	if int(prev_high_score) < MyGlobals.player_score:
		save_to_file(str(MyGlobals.player_score))
	get_tree().quit()

func check_for_high_score_file(path):
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name == "save_game.txt":
				return
			file_name = dir.get_next()
	else:
		print("no directory here")
	save_to_file(str(0))
	return
