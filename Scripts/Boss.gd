extends KinematicBody2D

export var limit_y = 350
export var score = 75

var ready = false

func _ready():
	randomize()
