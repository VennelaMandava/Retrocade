# level_menu.gd
extends Control

@onready var lvl_2_btn = $Level2Button
@onready var lvl_3_btn = $Level3Button


	


func _on_level_1_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn") # Your current scene


func _on_level_2_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_level_3_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")
