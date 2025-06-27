extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
@export var move_speed: float = 200.0
@export var acceleration: float = 55.0

var movement_direction: Vector2 = Vector2.ZERO


func _ready() -> void:
	animation_tree.active = true;
	
	DialogueManager.show_example_dialogue_balloon(load("res://item0.dialogue"));
	

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

func _on_audio_stream_player_2d_finished() -> void:
	audio_player.play()
