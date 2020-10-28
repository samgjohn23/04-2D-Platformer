extends KinematicBody2D

export var speed = 100 
export var damage = 10
var direction = 1
var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity.x += direction * speed
	move_and_slide_with_snap(velocity, Vector2.UP)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		print(collision.collider.name)
		if collision.collider.name == "Platform":
			velocity.x = 0
			direction *= -1
		if collision.collider.name == "Player":
			collision.collider.do_damage(damage)
