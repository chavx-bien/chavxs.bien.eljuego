extends Node

var flecha = preload("res://escenas/Flechaaaa.tscn")
var coins = 0
@onready var coins_label = $CanvasLayer/CoinsLabel
	
	


func add_coin():
	coins += 1
	coins_label.text = "Ingredientes " + str(coins)
	var instance = flecha.instantiate()
	instance.position = Vector2(370, 166)
	if coins == 1:
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/item1.dialogue"))
	if coins == 2:
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/item2.dialogue"))
	if coins == 3:
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/item3.dialogue"))
	if coins == 4:
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/item4.dialogue"))
	if coins == 5:
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/item5.dialogue"));
		add_child(instance)
		
