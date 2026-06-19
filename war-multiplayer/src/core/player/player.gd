extends Node2D
class_name Player

@warning_ignore("unused_signal") signal my_turn
@warning_ignore("unused_signal") signal await_other_turn

var name_player: String = "Jogador"
var color: Color = Color.RED

var cards: Array[Card]

var adding_troops: int = 0

func add_card(card: Card) -> void:
	cards.append(card)
