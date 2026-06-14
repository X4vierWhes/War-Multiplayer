extends Node2D
class_name Territory

@onready var rich_text_label: RichTextLabel = %RichTextLabel
@onready var button: Button = %Button

@export_category("Parameters")
@export var texture: TextureRect
@export var color: Color = Color.WHITE
@export var connected_regions: Array[Territory] = []
@export var territory_name: String
@export var army_number: int = 1

var player_in_domain: Player
var state:= Globals.game_state
var texture_base_scale: Vector2
const label_text: String = "[wave freq=5.0 amp=50.0 connected=0] {text} [/wave]"

func _ready() -> void:
	player_in_domain = Globals.player
	texture_base_scale = texture.scale
	button.global_position = texture.global_position
	_change_color(color)
	_change_army_count(army_number)

func _attack(territory_to_attack: Territory) -> void:
	pass

func defend() -> void:
	pass

func _mobilize_troops(trops_to_mobilize: int, territory_to_mobilize: Territory) -> void:
	pass

func _take_action() -> void:
	match(Globals.game_state):
		Globals.State.ATTACK:
			print("Atacando")
		Globals.State.MOBILIZING:
			print("Mobilizando")
			Globals.game_state = Globals.State.GIVE
			Globals.action_territory = self
			Globals.troops_to_mobilize = 1
		Globals.State.GIVE:
			print("Give")
			if Globals.action_territory != self:
				Globals.action_territory._change_army_count(-1)
				_change_army_count(1)
				Globals.game_state = Globals.State.MOBILIZING


func _change_army_count(amount: int) -> void:
	army_number += amount
	rich_text_label.text = label_text.replace("{text}", str(army_number))

func _change_color(new_color: Color) -> void:
	var shader_material = texture.material as ShaderMaterial
	if shader_material:
		shader_material.set_shader_parameter("new_color", new_color)

func _on_button_pressed() -> void:
	if player_in_domain.color == color:
		_take_action()
	else:
		print("Not in domain")

func _on_button_mouse_entered() -> void:
	if player_in_domain.color == color:
		var tween: Tween = create_tween()
		tween.tween_property(texture, "scale", Vector2(texture_base_scale.x + .2,texture_base_scale.y + .2), 0.5)

func _on_button_mouse_exited() -> void:
	if player_in_domain.color == color:
		var tween: Tween = create_tween()
		tween.tween_property(texture, "scale", Vector2(texture_base_scale.x, texture_base_scale.y), 0.5)
