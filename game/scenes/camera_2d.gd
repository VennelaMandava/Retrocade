extends Camera2D

# Export paths so you can easily assign your players in the Inspector
@export var player1: CharacterBody2D
@export var player2: CharacterBody2D

# Adjust these to fit your arcade layout
@export var min_zoom: float = 1.5   # Maximum zoom-out limit (prevents players from looking like ants)
@export var max_zoom: float = 4.0   # Maximum zoom-in limit (matching Brackeys' default zoom)
@export var margin: Vector2 = Vector2(150, 100) # Screen padding buffer around players

func _process(_delta: float) -> void:
	# Safety check to ensure both players exist in the scene
	if not player1 or not player2:
		return
		
	# 1. Calculate the midpoint position between both players
	var midpoint: Vector2 = (player1.global_position + player2.global_position) / 2.0
	global_position = midpoint
	
	# 2. Adjust zoom based on how far apart the players are
	_update_zoom()

func _update_zoom() -> void:
	# Get the absolute distance between players on both axes
	var distance_x: float = abs(player1.global_position.x - player2.global_position.x) + margin.x
	var distance_y: float = abs(player1.global_position.y - player2.global_position.y) + margin.y
	
	# Get the viewport size to calculate scaling ratios
	var screen_size: Vector2 = get_viewport_rect().size
	
	# Calculate necessary zoom levels for both axes
	var zoom_x: float = screen_size.x / distance_x
	var zoom_y: float = screen_size.y / distance_y
	
	# Use the smaller zoom level so neither player gets cut off horizontally or vertically
	var target_zoom: float = min(zoom_x, zoom_y)
	
	# Clamp the zoom value between your set minimum and maximum constraints
	target_zoom = clamp(target_zoom, min_zoom, max_zoom)
	
	# Apply the calculated zoom uniformly
	zoom = Vector2(target_zoom, target_zoom)
