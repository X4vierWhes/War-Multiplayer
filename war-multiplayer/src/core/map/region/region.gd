extends Node2D
class_name Region

@export_category("Parameters")
@export var region_name: String = "Region"
@export var amount_of_cards: int = 0
@export var bonus: int = 1
@export var territorys: Array[Territory] = []

func set_game_manager(gm: GameManager, players: Array[Player]) -> void:
	for t in get_children():
		if t is Territory:
			t.set_gm(gm)

func get_troops_to_add(player_request: Player) -> int:
	var troops: int = 0
	for i in get_children():
		var territory: Territory = i as Territory
		if territory.color == player_request.color:
			troops += 1
	return troops

func give_bonus() -> void:
	pass
