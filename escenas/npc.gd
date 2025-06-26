extends Area2D

	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/npc.dialogue"))
