extends Control
class_name MoveTroops

@warning_ignore("unused_signal") signal confirmar_acao(quant: int)
@warning_ignore("unused_signal") signal cancelar_acao

@onready var cancelar: Button = %cancelar
@onready var texto: Label = %texto
@onready var botao_remover: Button = %BotaoRemover
@onready var quantidade: Label = %quantidade
@onready var botao_adicionar: Button = %BotaoAdicionar
@onready var texto_2: Label = %texto2
@onready var concluir: Button = %concluir

var territorio_origem: Territory
var territorio_destino: Territory

var contador:int = 1:
	set(i):
		contador = i
		if quantidade:
			quantidade.text = str(i)

func _ready() -> void:
	botao_adicionar.pressed.connect(_incrementar_contador)
	botao_remover.pressed.connect(_decrementar_contador)
	cancelar.pressed.connect(_cancelar)
	concluir.pressed.connect(_concluir)

func _incrementar_contador() -> void:
	if contador == territorio_origem.army_number: return
	contador += 1
	territorio_origem._change_army_count(-1)
	territorio_destino._change_army_count(1)

func _decrementar_contador() -> void:
	if contador == 1: return
	contador -= 1
	territorio_origem._change_army_count(1)
	territorio_destino._change_army_count(-1)

func _concluir() -> void:
	pass

func _cancelar() -> void:
	pass
