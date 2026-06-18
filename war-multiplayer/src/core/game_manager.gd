extends Node2D
class_name GameManager

@export var map_manager: MapManager

enum GameState{ATTACK, MOBILIZING, AWAIT, GIVE, ATTACKING}
var actual_state: GameState = GameState.MOBILIZING

var players: Array[Player]
var current_player: int = 0
var cardStack: Array[Card]

func _ready() -> void:
	pass

func give_card() -> void:
	if cardStack.size() == 0: return 
	players[current_player].add_card(cardStack.pop_front())
