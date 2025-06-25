extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree

@export var move_speed: float = 100.0
@export var acceleration: float = 15.0
@export var fullscreen: bool = false

var movement_direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	animation_tree.active = true

func _physics_process(delta: float) -> void:
	movement_direction = Vector2(Input.get_axis("izq","der"), Input.get_axis("atras","adelante"))
	if movement_direction.length() > 0:
		movement_direction = movement_direction.normalized()
	velocity = movement_direction * move_speed
	move_and_slide()
	
	if movement_direction != Vector2.ZERO:
		animation_tree["parameters/conditions/is_moving"] = true
		animation_tree["parameters/conditions/not_moving"] = false
	else:
		animation_tree["parameters/conditions/is_moving"] = false
		animation_tree["parameters/conditions/not_moving"] = true
	
	animation_tree["parameters/Walk/blend_position"] = movement_direction
#var direction : Vector2 = Vector2()

func _on_fullscreen_pressed():
	if fullscreen:
		print("fullscreen")
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		print("window")
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	fullscreen = not fullscreen
#func read_input():
#	velocity = Vector2()
	
#	if Input.is_action_pressed("adelante"):
#		velocity.y -= 1
#		direction = Vector2(0, -1)
		
#	if Input.is_action_pressed("atras"):
#		velocity.y += 1
#		direction = Vector2(0, 1)
	
#	if Input.is_action_pressed("izq"):
#		velocity.x -= 1
#		direction = Vector2(-1, 0)
#		$Sprite.flip_h = false
		
#	if Input.is_action_pressed("der"):
#		velocity.x += 1
#		direction = Vector2(1, 0)
#		$Sprite.flip_h = true
		
#	velocity = velocity.normalized()
#	velocity = move_and_slide(velocity * 200)
	
#func _physics_process(delta):
#		read_input()
