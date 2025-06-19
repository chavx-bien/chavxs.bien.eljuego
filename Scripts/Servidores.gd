extends Area2D

var active = false


func _ready():
	$AnimationTree.active = true
	connect("body_entered", self, "_on_Servidores_body_entered")
	connect("body_exited", self, "_on_Servidores_body_exited")

func _input(event):
	if event.is_action_pressed("accion") and active:
		$AnimationTree.set("parameters/Movimiento/current", 1)
		$TimerTransition.start()


func _on_Servidores_body_entered(body):
	if body.name == "ghostLaberinto":
		active = true
		
func _on_Servidores_body_exited(body):
	if body.name == "ghostLaberinto":
		active = false



