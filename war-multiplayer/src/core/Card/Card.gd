extends RefCounted
class_name Card

enum {Circle, Triangle, Square, Joker}

var territory: Territory
var figure: int

func _init(new_territorio:Territory, new_figure:int) -> void:
	territory = new_territorio
	figure = new_figure

static func _compare_cards(cards: Array[Card]) -> bool:
	if cards.size() != 3: return ERR_INVALID_PARAMETER
	if cards[0] == cards[1] or cards[0] == cards[2] or cards[1] == cards[2]: 
		return ERR_INVALID_PARAMETER
	
	for card in cards: if card.figure == Joker: return true
	if (cards[0].figure == cards[1].figure and 
		cards[0].figure == cards[2].figure):
		return true
	elif (
		cards[0].figure != cards[1].figure and
		cards[0].figure != cards[2].figure and
		cards[1].figure != cards[2].figure): 
		return true
	else: return false
