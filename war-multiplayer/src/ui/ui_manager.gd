extends Control
class_name UiManager

@warning_ignore("unused_signal") signal ui_await
var game_manager: GameManager = null

func connect_signals(gm: GameManager) -> void:
	game_manager = gm

func show_ui(state: GameManager.GameState) -> void:
	match(state):
		GameManager.GameState.MOBILIZING:
			return
