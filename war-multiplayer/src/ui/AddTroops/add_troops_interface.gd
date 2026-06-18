extends Control
class_name AddTroops

signal confirmar_acao(quant: int)
signal cancelar_acao

@onready var cancelar: Button = %cancelar
@onready var botao_remover: Button = %BotaoRemover
@onready var quantidade: Label = %quantidade
@onready var botao_adicionar: Button = %BotaoAdicionar
@onready var concluir: Button = %concluir

var territorio_destino: Territory

var max_quantidade:int

var contador:int:
	set(i):
		contador = i
		if quantidade:
			quantidade.text = str(i)

func _ready() -> void:
	contador = 1
	botao_adicionar.pressed.connect(_incrementar_contador)
	botao_remover.pressed.connect(_decrementar_contador)
	concluir.pressed.connect(confirmar_acao.emit.bind(contador))
	cancelar.pressed.connect(cancelar_acao.emit)

func _incrementar_contador() -> void:
	if contador == max_quantidade: return
	contador += 1
	territorio_destino.army_number += 1

func _decrementar_contador() -> void:
	if contador == 1: return
	contador -= 1
	territorio_destino.army_number -= 1
