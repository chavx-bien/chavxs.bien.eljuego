extends Control


func _on_button_pressed() -> void:
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"));
	
	#get_tree().change_scene_to_file("res://escenas/Chavxs.tscn")
