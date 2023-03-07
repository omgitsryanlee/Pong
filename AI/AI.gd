extends CharacterBody2D

var speed = 400
var motion_velocity = Vector2.ZERO
var ball

func _ready():
	ball = get_parent().find_child("Ball")

func _physics_process(delta):
	get_opponent_direction()
	move_and_slide()

func get_opponent_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y: 
			velocity = transform.y * speed
			return velocity
		else:
			velocity = transform.y * -1 * speed
			return  velocity
	else: 
		velocity = transform.y * speed * 0
		return velocity
