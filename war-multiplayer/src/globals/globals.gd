extends Node

enum State{ATTACK, PREPARING, MOBILIZING, GIVE, AWAIT}

var game_state:= State.MOBILIZING

var COLOR_CHANGER := preload("uid://cuxtvhhfbh5jm") as Shader

var troops_to_mobilize: int = 1

var action_territory: Territory
