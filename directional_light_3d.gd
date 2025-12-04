extends Node3D

@export var sun: DirectionalLight3D
var timer := 0.0

func _process(delta):
	timer += delta
	if timer > 10.0:  # каждые 10 секунд
		change_weather()
		timer = 0.0

func change_weather():
	if sun.light_energy > 0.8:
		sun.light_energy = 0.3   # ночь
	else:
		sun.light_energy = 1.2   # день
