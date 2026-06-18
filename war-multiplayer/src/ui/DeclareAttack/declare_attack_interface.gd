extends Control
class_name DeclareAttack

signal confirmar_acao(quant: int)
signal cancelar_acao

@onready var cancelar: Button = %cancelar
@onready var botao_remover: Button = %BotaoRemover
@onready var quantidade: Label = %quantidade
@onready var botao_adicionar: Button = %BotaoAdicionar
@onready var concluir: Button = %concluir

var territorio_origem: Territory
var territorio_destino: Territory

var contador:int = 0:
	set(i):
		contador = i
		if quantidade:
			quantidade.text = str(i)

func _ready() -> void:
	botao_adicionar.pressed.connect(_incrementar_contador)
	botao_remover.pressed.connect(_decrementar_contador)
	cancelar.pressed.connect(cancelar_acao.emit)
	concluir.pressed.connect(confirmar_acao.emit.bind(contador))

func connect_signals(gm: GameManager) -> void:
	pass

func _incrementar_contador() -> void:
	if contador == territorio_origem.territorio.quant: return
	contador += 1
	territorio_origem.army_number -= 1
	territorio_destino.army_number += 1

func _decrementar_contador() -> void:
	if contador == 1: return
	contador -= 1
	territorio_origem.army_number += 1
	territorio_destino.army_number -= 1
