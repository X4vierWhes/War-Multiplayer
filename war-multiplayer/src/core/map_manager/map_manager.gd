extends Node2D
class_name MapManager

@export var maps: Array[PackedScene]
var game_manager: GameManager = null 

func spawn_map(gm: GameManager, players: Array[Player]) -> void:
	game_manager = gm
	for i in maps:
		var region:= i.instantiate() as Region
		region.set_game_manager(gm, players)
		add_child(region)

func get_gm() -> GameManager:
	return game_manager
