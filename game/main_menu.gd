# main_menu.gd
extends Control




func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn") # Your current scene
func _unhandled_input(event: InputEvent) -> void:
	# Check if the player pressed the start action you set up in Project Settings
	# Replace "start_key" with the exact name you typed in your Input Map
	if event.is_action_pressed("p2_start") or event.is_action_pressed("p1_start"):
			get_tree().change_scene_to_file("res://scenes/game.tscn") # Your current scene
	

func _on_quit_pressed() -> void:
	get_tree().quit()
