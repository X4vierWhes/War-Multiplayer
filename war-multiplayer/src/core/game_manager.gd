extends Node2D
class_name GameManager

@export var map_manager: MapManager
@export var ui_manager: UiManager
@export var turn_manager: TurnManager
@export var players_colors: Array[Color]

enum GameState{ATTACK, MOBILIZING, AWAIT, GIVE, ATTACKING}
var actual_state: GameState = GameState.MOBILIZING

var players: Array[Player]
var current_player: int = 0
var cardStack: Array[Card]

var action_territory: Territory
var target_territory: Territory

@warning_ignore("unused_signal") signal await_ui

func _ready() -> void:
	
	map_manager.spawn_map(self, players)

func give_card() -> void:
	if cardStack.size() == 0: return 
	players[current_player].add_card(cardStack.pop_front())

func show_ui() -> void:
	pass

func change_game_state(new_state: GameState) -> void:
	actual_state = new_state

func get_game_state() -> GameState:
	return actual_state

func refresh_game_state() -> void:
	pass

func set_action(action: Territory) -> void:
	print("GM Action_Territory:", action.name)
	action_territory = action

func set_target(target: Territory) -> void:
	print("GM Action_Territory:", target.name)
	target_territory = target
