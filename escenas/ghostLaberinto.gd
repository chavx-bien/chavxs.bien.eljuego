extends KinematicBody2D

var velocity : Vector2 = Vector2()
var direction : Vector2 = Vector2()

func read_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("adelante"):
		velocity.y -= 1
		direction = Vector2(0, -1)
		
	if Input.is_action_pressed("atras"):
		velocity.y += 1
		direction = Vector2(0, 1)
	
	if Input.is_action_pressed("izq"):
		velocity.x -= 1
		direction = Vector2(-1, 0)
		$Sprite.flip_h = false
		
	if Input.is_action_pressed("der"):
		velocity.x += 1
		direction = Vector2(1, 0)
		$Sprite.flip_h = true
		
	velocity = velocity.normalized()
	velocity = move_and_slide(velocity * 200)
	
func _physics_process(delta):
		read_input()
