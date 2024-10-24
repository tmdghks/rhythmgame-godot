extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(5):
		print("반복 횟수: ", i)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
