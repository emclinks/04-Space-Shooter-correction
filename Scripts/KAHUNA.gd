extends RigidBody2D

var ready = true
var velocity = Vector2(0,0)
export var min_speed = 300
export var max_speed = 475
export var damage = 50

onready var default_timer = $Timer.wait_time


func _ready():
	randomize()
	position.x = randi() % int(get_viewport_rect().size.x)
	velocity.y = max(randi() % max_speed, min_speed)
	contact_monitor = true
	set_max_contacts_reported(4)
	linear_velocity = velocity
	
	if ready:
		ready = false
		$Timer.start()

func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		if c.name == "Player":
			c.change_health(-damage)
	
	
	if position.y > get_viewport_rect().size.y + 150:
		queue_free()

func _integrate_forces(state):
	#state.set_linear_velocity(velocity)
	pass

func _on_Timer_timeout():
	ready = true
