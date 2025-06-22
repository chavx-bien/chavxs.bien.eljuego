extends Node2D

const SCENE_NAMES = preload("res://Scripts/niveles.gd");

var nextLevel = null;

@onready var  viewPort = $SubViewportContainer.get_child(0);
@onready var animPlayer = $AnimationPlayer;
@onready var isPaused = false;

var currentLevel
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	currentLevel = viewPort.get_child(0)
	currentLevel.get_child(0).connect("changeLevel", Callable(self, "handleLevelChanged"));
	var dialogic = $Dialogic
	Dialogic.start("intro")

func handleLevelChanged(nextLevelName: String):
	nextLevel = load("res://escenas/" + nextLevelName + ".tscn").instance();
#	nextLevel = load("res://escenas/" + "Terrain" + ".tscn").instance();
	#nextLevel = load("res://escenas/" + "Piedra_Scene" + ".tscn").instance();
	animPlayer.play("Fade_Out");
	
	print("loaded " + nextLevelName);


func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	match anim_name:
		"Fade_Out":
			currentLevel.queue_free();
			currentLevel = nextLevel;
			viewPort.add_child(nextLevel);	
			currentLevel.get_child(0).connect("changeLevel", self, "handleLevelChanged");
			animPlayer.play("Fade_In");
