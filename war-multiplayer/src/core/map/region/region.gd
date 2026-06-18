extends Node2D
class_name Region

@export_category("Parameters")
@export var region_name: String = "Region"
@export var amount_of_cards: int = 0
@export var bonus: int = 1
@export var territorys: Array[Territory] = []

func give_bonus() -> void:
	pass
