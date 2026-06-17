extends Node2D
class_name Territory

@export var color: Color = Color.BLUE
@export var texture: Sprite2D

var data: MapTerritory
const army_label_text: String = "[wave freq=5.0 amp=50.0 connected=0] {text} [/wave]"

func receive_attack() -> void:
	pass

func mobilize_troops() -> void:
	pass

func try_to_defend() -> void:
	pass

func make_attack() -> void:
	pass

func update_interface() -> void:
	pass
