extends Node2D
class_name TurnManager

@export var ui_manager: UiManager

@warning_ignore("unused_signal") signal turn_changed
#enum GameState{ADD = 0, ATTACK = 1, ADD = 2, AWAIT = 3, MOBILIZING, ATTACKING, ADDING}
enum TurnState{
	ADD = 0,
	ATTACK = 1,
	MOBILIZE = 2,
	AWAIT = 3
}
var actual_state: int = TurnState.ADD
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
	if !ui_manager.step_progress_bar():
		print("Turno acabou")
		turn_timer.stop()
		change_turn()

func change_turn() -> void:
	#TODO Mudança de turno
	print("Mudando turno")
	var next_state_value = (int(actual_state) + 1) % TurnState.size()
	actual_state = next_state_value as TurnState
	turn_changed.emit()
	if actual_state != TurnState.AWAIT:
		init_timers()
	else:
		#TODO AWAIT LOGIC
		print("AWAIT in TurnManager")

func pass_turn() -> void:
	pass

func get_actual_state() -> int:
	return actual_state

func set_actual_state(state: int) -> void:
	actual_state = state

func label_state() -> String:
	match(actual_state):
		TurnState.ADD:
			return "ADD"
		TurnState.ATTACK:
			return "ATTACK"
		TurnState.MOBILIZE:
			return "MOBILIZE"
		TurnState.AWAIT:
			return "AWAIT"
		_:
			return "null"
