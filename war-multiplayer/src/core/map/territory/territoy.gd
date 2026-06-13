extends Node2D
class_name Territory

@onready var rich_text_label: RichTextLabel = $CanvasLayer/RichTextLabel


@export_category("Parameters")
@export var territory_texture: TextureRect
@export var connected_regions: Array[Territory] = []
@export var territory_name: String
@export var army_number: int = 1

var player_in_domain: Player

const label_text: String = "[wave freq=5.0 amp=50.0 connected=0] {text} [/wave]"

func _ready() -> void:
	_change_color(Color.RED)
	_change_army_count(55)

func _change_army_count(amount: int) -> void:
	rich_text_label.text = label_text.replace("{text}", str(amount))

func _change_color(new_color: Color) -> void:
	print("entrei")
	var shader_material = territory_texture.material as ShaderMaterial
	if shader_material:
		shader_material.set_shader_parameter("new_color", new_color)
