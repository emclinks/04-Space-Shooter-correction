extends KinematicBody2D

export var limit_y = 350
export var score = 35

var ready = false

func _ready():
	randomize()
