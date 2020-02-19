extends Node2D

var ready = true
onready var default_timer = $Timer.wait_time

var Bullet_F = load("res://Scenes/Bullet_F.tscn")


func _ready():
	if ready:
		var b = Bullet_F.instance()
		add_child(b)
		ready = false
		$Timer.start()


func _on_Timer_timeout():
	ready = true
