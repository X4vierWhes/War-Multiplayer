extends Node2D
class_name MapManager

@export var turn_manager: TurnManager

@export var maps: Array[PackedScene]
var regions: Array[Region] = []
var game_manager: GameManager = null 

func spawn_map(gm: GameManager, players: Array[Player]) -> void:
	game_manager = gm
	for i in maps:
		var region:= i.instantiate() as Region
		region.set_game_manager(gm, players)
		add_child(region)
		regions.append(region)

func get_add_troops(player_request: Player) -> int:
	var troops: int = 0
	for i in regions:
		troops += i.get_troops_to_add(player_request)
	return troops

func get_gm() -> GameManager:
	return game_manager
