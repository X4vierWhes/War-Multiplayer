extends Node2D
class_name GameManager

@export var map_manager: MapManager
@export var ui_manager: UiManager
@export var turn_manager: TurnManager
@export var players_colors: Array[Color]

enum GameState{
	ATTACK = 0, 
	MOBILIZING = 1, 
	AWAIT = 2, 
	GIVE, 
	ATTACKING
	}
var actual_state: GameState = GameState.MOBILIZING

var players: Array[Player]
var current_player: int = 0
var cardStack: Array[Card]

var action_territory: Territory
var target_territory: Territory

@warning_ignore("unused_signal") signal await_ui

func _ready() -> void:
	ui_manager.connect_signals(self)
	map_manager.spawn_map(self, players)

func give_card() -> void:
	if cardStack.size() == 0: return 
	players[current_player].add_card(cardStack.pop_front())

func show_ui() -> void:
	match(turn_manager.get_actual_state()):
		TurnManager.TurnState.MOBILIZING:
			ui_manager.show_move_troops_ui()

func change_game_state(new_state: GameState) -> void:
	actual_state = new_state

func get_game_state() -> GameState:
	return actual_state

func refresh_game_state() -> void:
	#action_territory = null
	#target_territory = null
	if await_ui.has_connections():
		await_ui.emit()
	actual_state = turn_manager.get_actual_state()

func set_action(action: Territory) -> void:
	if !action:
		return
	action_territory = action
	print("GM Action_Territory:", action_territory.name)

func set_target(target: Territory) -> void:
	if !target:
		return
	print("GM Target_Territory:", target.name)
	target_territory = target

func realize_mobilizing_troops(troops: int) -> void:
	print("Game_Manager recebeu tropas:", troops)
	action_territory._change_army_count(-troops)
	target_territory._change_army_count(troops)
	refresh_game_state()
