extends Node2D
class_name GameManager

enum GameState{ATTACK, MOBILIZING, AWAIT, GIVE}

var players: Array[Player]
var current_player: int = 0
var cardStack: Array[Card]

func _ready() -> void:
	cardStack = [
		Card.new($map_manager.get_child(0).territorys[0], Card.Circle), 
		Card.new($map_manager.get_child(0).territorys[1], Card.Triangle), 
		Card.new($map_manager.get_child(0).territorys[2], Card.Square)
	] # provisório
	cardStack.shuffle()

func give_card() -> void:
	if cardStack.size() == 0: return 
	players[current_player].add_card(cardStack.pop_front())
