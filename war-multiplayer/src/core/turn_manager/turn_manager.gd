extends Node2D
class_name TurnManager

@export var ui_manager: UiManager

@warning_ignore("unused_signal") signal turn_changed
#enum GameState{ATTACK, MOBILIZING, AWAIT, ADD, GIVE, ATTACKING}
enum TurnState{
	ATTACK = 0,
	MOBILIZING = 1,
	AWAIT = 2,
	ADD = 3
}
var actual_state: int = TurnState.MOBILIZING
var turn_timer: Timer
@export_range(1.0, 180.0, 0.1) var timer = 45.0

func _ready() -> void:
	init_timers()

func init_timers() -> void:
	ui_manager.set_progress_bar_params(timer)
	turn_timer = Timer.new()
	turn_timer.wait_time = 1.0
	turn_timer.timeout.connect(on_turn_timer_timeout)
	add_child(turn_timer)
	turn_timer.start()

func on_turn_timer_timeout() -> void:
	#TODO Mudança de turnos
	if !ui_manager.step_progress_bar():
		print("Turno acabou")
		turn_timer.stop()
		pass

func pass_turn() -> void:
	pass

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
