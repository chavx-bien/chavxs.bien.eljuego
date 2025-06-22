extends MenuBar

const SCENE_NAMES = preload("res://Scripts/niveles.gd");


@onready var levelChanger = get_child(0);

func _ready():
	var dialog = Dialogic.start("intro")
	add_child(dialog)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
