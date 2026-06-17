extends Node2D
class_name GameManager

enum GameState{ATTACK, MOBILIZING, AWAIT, GIVE}

@export var players: int = 1
@export var players_colors: Array[Color] = []
