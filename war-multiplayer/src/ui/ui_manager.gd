extends Control
class_name UiManager

@export var add_troops: AddTroops
@export var move_troops: MoveTroops
@export var declare_attack: DeclareAttack

var game_manager: GameManager = null

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
	pass

func show_declare_attack_ui() -> void:
	pass

func hide_ui() -> void:
	for i in get_children():
		if i is Control:
			i.hide()
