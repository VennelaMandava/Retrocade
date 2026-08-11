extends Area2D # Fix 1: Must be Area2D to use collision signals

# Tracks how many player characters are currently standing in the exit zone
var players_in_zone: int = 0

# Note: Removed the '@onready var player = AnimatedSprite2D' line 
# because it was crashing/pointing to a class name rather than a node instance,
# and it isn't strictly needed for this specific zone logic!

func _ready() -> void:
	# Fix 2: Explicitly connect the signals so Godot runs these functions on contact
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	print("Exit zone initialized. Awaiting players...")

func _on_body_entered(body: Node2D) -> void:
	print("Something physically touched the area: ", body.name)
	
	if body.is_in_group("players"):
		players_in_zone += 1
		print("Player validated! Total players in zone: ", players_in_zone)
		check_level_complete()

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("players"):
		players_in_zone -= 1
		print("Player left the zone. Total players remaining: ", players_in_zone)

func check_level_complete() -> void:
	var coins_left = get_tree().get_nodes_in_group("coins").size()
	print("Checking completion... Coins remaining: ", coins_left)
	
	if players_in_zone == 2 and coins_left == 0:
		advance_to_level_2()

func advance_to_level_2() -> void:
	print("Level Complete! Moving to Level 2...")
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")
