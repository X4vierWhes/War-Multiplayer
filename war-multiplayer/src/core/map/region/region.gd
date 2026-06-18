extends Node2D
class_name Region

@export_category("Parameters")
@export var region_name: String = "Region"
@export var amount_of_cards: int = 0
@export var bonus: int = 1
@export var territorys: Array[Territory] = []

func set_game_manager(gm: GameManager, players: Array[Player]) -> void:
	for i in get_children():
		if i is Territory:
			i.gm = gm

func give_bonus() -> void:
	pass
