extends Node2D

const SCENE_NAMES = preload("res://Scripts/ScenePaths.gd");

onready var levelChanger = self.get_child(0);

var tiempo = 121

signal changeLevel(nextLevel);

func _on_Timer_timeout():
	if tiempo > 0:
		tiempo -= 1
		update_time()
	else:
		levelChanger.requestLevelChange(SCENE_NAMES.SCENE_PATHS.LABERINTO_MINIGAME)

func update_time():
	get_tree().get_nodes_in_group("tiempo")[0].text = String(tiempo/60) + ":" + String(tiempo%60)


func _on_TimerTransition_timeout():
	levelChanger.requestLevelChange(SCENE_NAMES.SCENE_PATHS.TELEMOVEL_CUTSCENE);
