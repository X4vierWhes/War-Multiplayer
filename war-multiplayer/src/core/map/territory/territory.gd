extends Node2D
class_name Territory

@onready var rich_text_label: RichTextLabel = %RichTextLabel
@onready var button: Button = %Button

@export_category("Parameters")
@export var texture: TextureRect
@export var color: Color = Color.WHITE
@export var connected_regions: Array[Territory] = []
@export var territory_name: String
@export var army_number: int = 0

var player_in_domain: Player = null
var gm: GameManager = null
var texture_base_scale: Vector2
const label_text: String = "[wave freq=5.0 amp=50.0 connected=0] {text} [/wave]"

func _ready() -> void:
	texture_base_scale = texture.scale
	player_in_domain = Globals.PLAYER
	if texture.material:
		texture.material = texture.material.duplicate()
	button.global_position = texture.global_position
	_change_color(color)
	_change_army_count(1)

func mobilize() -> void:
	if army_number <= 1:
		print("Tropas insuficientes")
		gm.set_action(null)
		gm.set_target(null)
		return
	gm.set_action(self)
	gm.change_game_state(GameManager.GameState.MOBILIZING)

func mobilizing() -> void:
	if gm.action_territory == self:
		print("Não pode mobilizar para si proprio")
		gm.set_action(null)
		return
	if gm.action_territory not in connected_regions:
		print("Não conectado")
		return
	gm.set_target(self)
	gm.show_ui()
	gm.change_game_state(GameManager.GameState.AWAIT)
	print("Aguarde...")
	await gm.await_ui

func attack() -> void:
	pass

func attacking() -> void:
	pass

func add() -> void:
	pass

func adding() -> void:
	pass

func awaiting() -> void:
	pass

func _take_action() -> void:
	match(gm.get_game_state()):
		GameManager.GameState.ATTACK:
			attack()
		GameManager.GameState.ATTACKING:
			attacking()
		GameManager.GameState.MOBILIZE:
			mobilize()
		GameManager.GameState.MOBILIZING:
			mobilizing()
		GameManager.GameState.ADD:
			add()
		GameManager.GameState.ADDING:
			adding()
		GameManager.GameState.AWAIT:
			awaiting()


func _change_army_count(amount: int) -> void:
	var aux: int = army_number + amount
	if aux < 1:
		return
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
