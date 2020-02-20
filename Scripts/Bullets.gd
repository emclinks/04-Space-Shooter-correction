extends Node2D

var ready = false
onready var default_timer = $Timer.wait_time

var Bullet_F = load("res://Scenes/Bullet F.tscn")

func _ready():
	pass

func fire(b):
	if ready:
		add_child(b)
		ready = false
		$Timer.start()

func _on_Timer_timeout():
	ready = true
