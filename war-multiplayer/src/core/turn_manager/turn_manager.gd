extends Node2D
class_name TurnManager

@export var turn_timer: float = 1.0

enum Turn{MOBILIZE, ATTACK, AWAIT}
var actual_state: Turn = Turn.MOBILIZE

func get_actual_state() -> Turn:
	return actual_state
