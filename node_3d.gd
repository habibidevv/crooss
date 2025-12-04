extends Node3D

@export var car1: Node3D
@export var car2: Node3D

func _ready():
	var choice = 1  # здесь можно менять выбор 1 или 2

	car1.visible = choice == 1
	car2.visible = choice == 2
