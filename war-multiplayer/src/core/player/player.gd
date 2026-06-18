extends RefCounted
class_name Player

var name: String = "Jogaor"
var color: Color = Color.RED

var cards: Array[Card]

func add_card(card: Card) -> void:
	cards.append(card)
