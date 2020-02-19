extends Node2D

export var max_enemies = 5
export var probability = 0.3

onready var Captain = load("res://Scenes/Captain.tscn")
onready var Hauler = load("res://Scenes/Hauler.tscn")
onready var Assault = load("res://Scenes/Assault.tscn")

func _ready():
	pass

func _on_Timer_timeout():
	if get_child_count() < max_enemies + 1:
		if randf() < 0.3:
			var e = Hauler.instance()
			add_child(e)
		elif randf() > 0.7:
			var e = Captain.instance()
			add_child(e)
		else:
			var e = Assault.instance()
			add_child(e)
