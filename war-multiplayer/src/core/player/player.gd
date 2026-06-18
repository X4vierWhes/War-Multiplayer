extends Node2D
class_name Player

var name_player: String = "Jogador"
var color: Color = Color.RED

var cards: Array[Card]

func add_card(card: Card) -> void:
	cards.append(card)
