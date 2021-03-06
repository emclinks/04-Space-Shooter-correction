extends KinematicBody2D

export var health = 100
export var score = 0
export var margin = 5
export var y_range = 300
export var acceleration = 0.4

var velocity = Vector2(0,0)

onready var VP = get_viewport_rect().size
onready var Bullet_F = load("res://Scenes/Bullet F.tscn")

signal healh_changed 
signal score_changed

func _ready():
	emit_signal("healh_changed")
	emit_signal("score_changed")

func change_health(h):
	health += h
	print(health)
	emit_signal("healh_changed")
	if health <= 0:
		die()

func changed_score(s):
	score += s
	emit_signal("score_changed")

func die():
	queue_free()

func _physics_process(_delta):
	if Input.is_action_pressed("Fire"):
		var b = Bullet_F.instance()
		b.position = position
		b.position.y -= -25
		get_node("/root/Game/Bullets").fire(b)
	
	if Input.is_action_pressed("Left"):
		velocity.x -= acceleration
	if Input.is_action_pressed("Right"):
		velocity.x += acceleration
	if Input.is_action_pressed("Up"):
		velocity.y -= acceleration
	if Input.is_action_pressed("Down"):
		velocity.y += acceleration
		
	if position.x < margin:
		velocity.x = 0
		position.x = margin
	if position.x > VP.x - margin:
		velocity.x = 0
		position.x = VP.x - margin
	if position.y < VP.y - y_range:
		velocity.y = 0
		position.y = VP.y - y_range
	if position.y > VP.y - margin:
		velocity.y = 0
		position.y = VP.y - margin
		
	var _collision = move_and_collide(velocity)
