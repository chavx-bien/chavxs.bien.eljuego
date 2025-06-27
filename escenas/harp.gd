extends AudioStreamPlayer2D


func _on_bacardi_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		play()

func _on_hielo_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		play()

func _on_mineral_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		play()

func _on_coca_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		play()

func _on_vaso_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		play()
