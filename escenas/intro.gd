extends Node2D

func _ready() -> void:
	DialogueManager.show_example_dialogue_balloon(load("res://intro.dialogue"));
func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_file("res://escenas/Menu.tscn")
