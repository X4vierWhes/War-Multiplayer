extends Node2D
class_name TurnManager

@warning_ignore("unused_signal") signal turn_changed
#enum GameState{ATTACK, MOBILIZING, AWAIT, GIVE, ATTACKING}
enum TurnState{
	ATTACK = 0,
	MOBILIZING = 1,
	AWAIT = 2
}
var actual_state: int = TurnState.MOBILIZING
var timer: Timer
@export_range(1.0, 180.0, 0.1) var turn_timer

func _ready() -> void:
	timer = Timer.new()
	timer.wait_time = turn_timer

func get_actual_state() -> int:
	return actual_state

func set_actual_state(state: int) -> void:
	actual_state = state

func label_state() -> String:
	match(actual_state):
		TurnState.ATTACK:
			return "ATTACK"
		TurnState.MOBILIZING:
			return "MOBILIZING"
		TurnState.AWAIT:
			return "AWAIT"
		_:
			return "null"
