extends Control
class_name UiManager

@export var turn_manager: TurnManager

@export var add_troops: AddTroops
@export var move_troops: MoveTroops
@export var declare_attack: DeclareAttack

var game_manager: GameManager = null

@onready var state_label: RichTextLabel = $state_label
@onready var turn_progress_bar: ProgressBar = $turn_progress_bar

const state_label_text: String = "[wave connected=0]{Game State}[/wave]"
const adding_label_text: String = "[wave connected=0]add: {amount}[/wave]"

func _ready() -> void:
	turn_manager.turn_changed.connect(change_turn)
	change_turn()

func connect_signals(gm: GameManager) -> void:
	game_manager = gm
	move_troops.connect_signals(game_manager)
	add_troops.connect_signals(game_manager)
	declare_attack.connect_signals(game_manager)

func show_move_troops_ui() -> void:
	move_troops.territorio_origem = game_manager.action_territory
	move_troops.territorio_destino = game_manager.target_territory
	move_troops.show()
	await game_manager.await_ui
	move_troops.hide()

func show_add_troops_ui() -> void:
	add_troops.show()
	await game_manager.await_ui
	add_troops.hide()

func show_declare_attack_ui() -> void:
	pass

func hide_ui() -> void:
	for i in get_children():
		if i is Control:
			i.hide()

func change_turn() -> void:
	state_label.text = state_label_text.replace("{Game State}", turn_manager.label_state())

func set_progress_bar_params(max_value: float, step: float = 10) -> void:
	turn_progress_bar.max_value = max_value * step
	turn_progress_bar.min_value = 0.0
	turn_progress_bar.value = max_value * step

func step_progress_bar(step: float = 10) -> bool:
	turn_progress_bar.value -= step
	if turn_progress_bar.value > 0:
		return true
	return false
