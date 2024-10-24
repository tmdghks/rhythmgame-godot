extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var score = 95
	if score > 90:
		print("A등급입니다!")
	elif score > 70:
		print("B등급입니다!")
	else:
		print("C등급입니다!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
