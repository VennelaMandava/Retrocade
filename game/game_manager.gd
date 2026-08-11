# game_manager.gd
extends Node

# Dictionary to track unlocked status of levels
var levels_unlocked = {
	"level_1": true,
	"level_2": false,
	"level_3": false
}

var current_level_id = "level_1"

func unlock_level(level_id: String):
	if levels_unlocked.has(level_id):
		levels_unlocked[level_id] = true
