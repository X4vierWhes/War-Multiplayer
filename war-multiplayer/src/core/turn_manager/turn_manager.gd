extends Node2D
class_name TurnManager

#enum GameState{ATTACK, MOBILIZING, AWAIT, GIVE, ATTACKING}
enum TurnState{
	ATTACK = 0,
	MOBILIZING = 1,
	AWAIT = 2
}
var actual_state: int = TurnState.MOBILIZING
@export var turn_timer: float = 1.0

func get_actual_state() -> int:
	return actual_state

func set_actual_state(state: int) -> void:
	actual_state = state
